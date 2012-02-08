class Link < ActiveRecord::Base
  belongs_to :theme
  has_many :clicks, dependent: :destroy
  
  attr_accessible :uri
  
  validates :uri, presence: true, format: { with: URI::regexp(%w(http https)) }, uniqueness: { scope: :theme_id }
  
  before_validation -> { uri.try(:gsub!, /\/*$/, "") }
  
  def subdomain
    theme.name.downcase
  end
  
  def slug
    (id - 1).to_s(theme.words.count).scan(/./).map { |i| theme.words[i.to_i] }.join("-")
  end
  
  def self.find_by_subdomain_and_slug(subdomain, slug)
    words = Theme.find(:first, conditions: ["lower(name) = ?", subdomain.downcase]).words
    find(slug.split("-").map { |t| words.index(t) }.join.to_i(words.count) + 1)
  end
end
