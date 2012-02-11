class Theme < ActiveRecord::Base
  has_many :links, dependent: :destroy
  
  attr_accessible :name
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
  serialize :words
  
  def self.most_popular
    @most_popular ||= Theme.all.sort_by { |theme| theme.links.count }.last
  end
  
  def self.least_popular
    @least_popular ||= Theme.all.sort_by { |theme| theme.links.count }.first
  end
end
