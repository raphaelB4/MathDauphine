class AddSolutionToExercices < ActiveRecord::Migration[5.0]
  def change
    add_column :exercices, :solution, :string
  end
end
