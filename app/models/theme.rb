class Theme < ActiveRecord::Base
  has_many :links, dependent: :destroy
  
  attr_accessible :name
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
  serialize :words
end
