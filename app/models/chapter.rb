class Chapter < ApplicationRecord
has_many :exercices
# validates :name, presence=true , uniqueness: true

end
