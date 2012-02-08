require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  GOOGLE_SLUG = "superman-spiderman-spiderman-batman-superman-wolverine-batman-batman-wolverine-spiderman-wolverine-superman-spiderman-batman-superman"
  YAHOO_SLUG = "velociraptor-brachiosaur-diplodocus-velociraptor-tyrannosaur-tyrannosaur-velociraptor-diplodocus-tyrannosaur-diplodocus-brachiosaur-diplodocus-diplodocus-diplodocus"
  
  test "URI is required" do
    link = Link.new
    assert link.invalid?
    assert link.errors[:uri].any?
  end
  
  test "URI must be unique (case-sensitive)" do
    link = Link.new(uri: "http://www.Google.com")
    assert link.valid?
  end
  
  test "URI must be valid" do
    link = Link.new(uri: "ftp://www.google.com")
    assert link.invalid?
    assert link.errors[:uri].any?
  end
  
  test "deletes associated clicks on destroy" do
    assert_difference("Click.count", -links(:google).clicks.count) { links(:google).destroy }
  end
  
  test "strips trailing slashes before validation" do
    link = Link.new(uri: "http://www.example.com/something//")
    link.valid?
    assert_equal "http://www.example.com/something", link.uri
  end
  
  test "subdomain generation" do
    assert_equal "superheroes", links(:google).subdomain
    assert_equal "dinosaurs", links(:yahoo).subdomain
  end
  
  test "slug generation" do
    assert_equal GOOGLE_SLUG, links(:google).slug
    assert_equal YAHOO_SLUG, links(:yahoo).slug
  end
  
  test "find by slug" do
    assert_equal links(:google), Link.find_by_subdomain_and_slug("superheroes", GOOGLE_SLUG)
    assert_equal links(:yahoo), Link.find_by_subdomain_and_slug("dinosaurs", YAHOO_SLUG)
  end
end
