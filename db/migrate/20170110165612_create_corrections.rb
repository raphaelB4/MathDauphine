class CreateCorrections < ActiveRecord::Migration[5.0]
  def change
    create_table :corrections do |t|
      t.integer :problem_id
      t.integer :scholar_id

      t.timestamps
    end
    add_index :corrections, :problem_id
    add_index :corrections, :scholar_id
    add_index :corrections, [:problem_id, :scholar_id], unique: true
  end
end
