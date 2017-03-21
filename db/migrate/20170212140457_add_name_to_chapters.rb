class AddNameToChapters < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :name, :string
  end
end
