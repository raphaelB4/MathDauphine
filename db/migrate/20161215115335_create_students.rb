class CreateStudents < ActiveRecord::Migration[5.0]
  
 #L'élève a un nom et un email. 
  def change
    create_table :students do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
