class Exercice < ApplicationRecord
  belongs_to :chapter
  validates :chapter_id, presence: true

  has_many :passive_corrections, class_name:  "Correction",
                                   foreign_key: "problem_id",
                                   dependent:   :destroy

  has_many :pupils, through: :passive_corrections, source: :scholar

end
