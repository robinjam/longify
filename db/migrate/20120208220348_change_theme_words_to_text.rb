class ChangeThemeWordsToText < ActiveRecord::Migration
  def up
    change_column :themes, :words, :text, limit: nil
  end
  def down
    change_column :themes, :words, :string
  end
end
