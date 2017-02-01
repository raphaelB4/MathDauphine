class AddAnswerToExercices < ActiveRecord::Migration[5.0]
  def change
    add_column :exercices, :answer, :integer
  end
end
