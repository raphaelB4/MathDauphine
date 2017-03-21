class CreateEleves < ActiveRecord::Migration[5.0]
  
  #L'élève a un nom et un email.
  def change
    create_table :eleves do |t|
      t.string :nom
      t.string :email

      t.timestamps
    end
  end
end
