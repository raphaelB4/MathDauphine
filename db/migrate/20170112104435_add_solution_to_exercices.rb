class AddSolutionToExercices < ActiveRecord::Migration[5.0]
#On ajoute le lien vers la solution à l'exercice.
  def change
    add_column :exercices, :solution, :string
  end
end
