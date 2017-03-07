class AddNatureToExercices < ActiveRecord::Migration[5.0]
  #C'est le nombre de choix au QCM.
  def change
    add_column :exercices, :nature, :integer, default: 0
  end
end
