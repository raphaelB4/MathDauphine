class CreateExercices < ActiveRecord::Migration[5.0]
  
 #Les exercices sont issus des chapitres.
  def change
    create_table :exercices do |t|
      t.references :chapter, foreign_key: true

      t.timestamps
    end
  end
end
