class AddPasswordDigestToEleves < ActiveRecord::Migration[5.0]
  def change
    add_column :eleves, :password_digest, :string
  end
end
