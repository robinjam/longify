require 'test_helper'

class LinksHelperTest < ActionView::TestCase
  # TODO: Add regression test for longify method
  
  test "calc_percentage_increase" do
    assert_equal "2557.143%", calc_percentage_increase(links(:google))
  end
end
