class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.references :link
      t.string :ip
      t.string :user_agent
      t.string :referer

      t.timestamps
    end
    add_index :clicks, :link_id
  end
end
