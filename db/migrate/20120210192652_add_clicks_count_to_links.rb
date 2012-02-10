class AddClicksCountToLinks < ActiveRecord::Migration
  def up
    add_column :links, :clicks_count, :integer, default: 0
    
    Link.reset_column_information
    Link.all.each { |link| Link.update_counters link.id, clicks_count: link.clicks.count }
  end
  
  def down
    remove_column :links, :clicks_count
  end
end
