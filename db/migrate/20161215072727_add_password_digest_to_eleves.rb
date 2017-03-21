class AddPasswordDigestToEleves < ActiveRecord::Migration[5.0]
 #On ajoute un mot de passe pour l'élève.
  def change
    add_column :eleves, :password_digest, :string
  end
end
