class AddSolutionStatementToExercices < ActiveRecord::Migration[5.0]
  def change
    add_column :exercices, :solution_statement, :text
  end
end
