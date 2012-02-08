class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.string :words

      t.timestamps
    end
    add_index :themes, :name, unique: true
  end
end
