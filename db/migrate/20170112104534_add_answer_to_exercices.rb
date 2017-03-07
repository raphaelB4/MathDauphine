class AddAnswerToExercices < ActiveRecord::Migration[5.0]

  #La réponse est un entier.
  def change
    add_column :exercices, :answer, :integer
  end
end
