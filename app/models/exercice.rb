class Exercice < ApplicationRecord
  #Un exercice appartient à un chapitre
  belongs_to :chapter
  validates :chapter_id, presence: true
  validates :statement, presence: true
  validates :answer, presence: true
  validates :nature, presence: true, inclusion: { in: 0..6 }

  #On enregistre les élèves qui ont réussi cette exercice.
  has_many :passive_corrections, class_name:  "Correction",
                                   foreign_key: "problem_id",
                                   dependent:   :destroy

  has_many :pupils, through: :passive_corrections, source: :scholar

end
