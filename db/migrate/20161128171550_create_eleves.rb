class CreateEleves < ActiveRecord::Migration[5.0]
  def change
    create_table :eleves do |t|
      t.string :nom
      t.string :email

      t.timestamps
    end
  end
end
