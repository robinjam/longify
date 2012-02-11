class ChangeLinkUriToText < ActiveRecord::Migration
  def up
    change_column :links, :uri, :text, limit: nil
  end
  def down
    change_column :links, :uri, :string
  end
end
