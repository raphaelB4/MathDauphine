class Correction < ApplicationRecord
  belongs_to :scholar, class_name: "Student"
  belongs_to :problem, class_name: "Exercice"
  validates :scholar_id, presence: true
  validates :problem_id, presence: true
end
