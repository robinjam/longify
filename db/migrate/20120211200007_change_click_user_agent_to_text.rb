class ChangeClickUserAgentToText < ActiveRecord::Migration
  def up
    change_column :clicks, :user_agent, :text, limit: nil
  end
  def down
    change_column :clicks, :user_agent, :string
  end
end
