class Student < ApplicationRecord

  #On enregistre les exercices que l'élève a réussi. il faut creer des couples (exercices élève) 
  has_many :active_corrections, class_name: "Correction", 
                                foreign_key: "scholar_id", 
                                dependent: :destroy

  has_many :schooling, through: :active_corrections, source: :problem


  #Des détails avant de sauvegarder un élève
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

 #verifier si l'exercice en question a été fait
 def has_solved?(a_problem)
   schooling.include?(a_problem)
 end

 #ajouter un exercice à la liste des exercices fait
 def solve(a_problem)
   schooling << a_problem
 end

 #retirer un exercice de la liste.
 def unsolve(a_problem)
   schooling.delete(a_problem)
 end


 private


  def Student.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
