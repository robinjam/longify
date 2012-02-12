class Link < ActiveRecord::Base
  belongs_to :theme
  has_many :clicks, dependent: :destroy
  
  attr_accessible :uri
  
  validates :uri, presence: true, format: { with: URI::regexp(%w(http https)) }, uniqueness: { scope: :theme_id }
  
  before_validation -> { uri.try(:gsub!, /\/*$/, "") }
  
  scope :safe, where(flagged: false)
  
  def subdomain
    theme.name.downcase
  end
  
  def slug
    (id + OFFSET).to_s(theme.words.count).scan(/./).map { |i| theme.words[i.to_i(theme.words.count)] }.join("-")
  end
  
  def self.find_by_subdomain_and_slug!(subdomain, slug)
    words = Theme.find(:first, conditions: ["lower(name) = ?", subdomain.downcase]).words
    find(slug.split("-").map { |t| words.index(t).to_s(words.count) }.join.to_i(words.count) - OFFSET)
  rescue
    raise ActiveRecord::RecordNotFound.new("Could not find link with slug=#{slug}, subdomain=#{subdomain}")
  end
  
  private
  
  OFFSET = 593910272593910272593910272593910272
end
