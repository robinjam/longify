require 'test_helper'

class ThemeTest < ActiveSupport::TestCase
  test "name is required" do
    theme = Theme.new
    assert theme.invalid?
    assert theme.errors[:name].any?
  end
  
  test "name must be unique (case-insensitive)" do
    theme = Theme.new(name: "dinosaurs")
    assert theme.invalid?
    assert theme.errors[:name].any?
  end
  
  test "serializes words" do
    assert_equal ["brachiosaur", "tyrannosaur", "velociraptor", "diplodocus"], themes(:dinosaurs).words
  end
  
  test "deletes associated links on destroy" do
    assert_difference("Link.count", -themes(:dinosaurs).links.count) { themes(:dinosaurs).destroy }
  end
end
