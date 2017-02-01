class AddIssueToExercices < ActiveRecord::Migration[5.0]
  def change
    add_column :exercices, :issue, :string
  end
end
