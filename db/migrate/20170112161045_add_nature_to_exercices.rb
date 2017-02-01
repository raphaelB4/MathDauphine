class AddNatureToExercices < ActiveRecord::Migration[5.0]
  def change
    add_column :exercices, :nature, :integer
  end
end
