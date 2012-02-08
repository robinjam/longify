require 'test_helper'

class LinksHelperTest < ActionView::TestCase
  # TODO: Add regression test for longify method
  
  test "calc_percentage_increase" do
    assert_equal "5709.524%", calc_percentage_increase(links(:google))
  end
end
