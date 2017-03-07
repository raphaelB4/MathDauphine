class CreateChapters < ActiveRecord::Migration[5.0]
#Pour le moment rien dans chapitre. on dit juste qu'ils existent. 
 def change
    create_table :chapters do |t|

      t.timestamps
    end
  end
end
