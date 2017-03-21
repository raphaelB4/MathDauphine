class AddStatementToExercices < ActiveRecord::Migration[5.0]
  def change
    add_column :exercices, :statement, :text
  end
end
