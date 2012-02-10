require 'test_helper'

class PagesHelperTest < ActionView::TestCase
  test "most_popular_theme" do
    assert_equal themes(:dinosaurs), most_popular_theme
  end
  
  test "least_popular_theme" do
    assert_equal themes(:superheroes), least_popular_theme
  end
end
