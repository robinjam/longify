class Click < ActiveRecord::Base
  belongs_to :link
  
  attr_accessible :ip, :user_agent, :referer
  
  serialize :headers
end
