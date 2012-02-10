class Click < ActiveRecord::Base
  belongs_to :link, counter_cache: true
  
  attr_accessible :ip, :user_agent, :referer
  
  serialize :headers
end
