class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :theme
      t.string :uri

      t.timestamps
    end
    add_index :links, :theme_id
  end
end
