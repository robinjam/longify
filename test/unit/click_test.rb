require 'test_helper'

class ClickTest < ActiveSupport::TestCase
  test "caches count in link" do
    link = Link.create!(uri: 'http://www.example.com')
    assert_difference('link.clicks_count') do
      link.clicks.create!
      link.reload
    end
    assert_difference('link.clicks_count', -1) do
      link.clicks.first.destroy
      link.reload
    end
  end
end
