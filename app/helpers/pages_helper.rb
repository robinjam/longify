module PagesHelper
  def most_popular_theme
    @most_popular ||= Theme.all.sort_by { |theme| theme.links.count }.last
  end

  def least_popular_theme
    @least_popular ||= Theme.all.sort_by { |theme| theme.links.count }.first
  end
end
