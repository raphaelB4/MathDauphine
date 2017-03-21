class AddAdminToStudents < ActiveRecord::Migration[5.0]
  #Creer un super type d'utilisateur qui dispose de plus de pouvoir pour créer des exercices.
  def change
    add_column :students, :admin, :boolean, default: false
  end
end
