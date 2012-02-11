class ChangeClickRefererToText < ActiveRecord::Migration
  def up
    change_column :clicks, :referer, :text, limit: nil
  end
  def down
    change_column :clicks, :referer, :string
  end
end
