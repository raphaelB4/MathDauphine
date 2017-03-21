class AddIssueToExercices < ActiveRecord::Migration[5.0]

 #On enregistre dans l'exercice le lien vers la page de l'énoncé.
  def change
    add_column :exercices, :issue, :string
  end
end
