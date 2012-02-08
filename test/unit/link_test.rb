require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  GOOGLE_SLUG = "superman-superman-superman-spiderman-superman-superman-wolverine-spiderman-wolverine-superman-spiderman-superman-wolverine-superman-wolverine-wolverine-batman-wolverine-superman-superman-superman-wolverine-wolverine-batman-wolverine-wolverine-spiderman-superman-batman-spiderman-spiderman-wolverine-wolverine-spiderman-wolverine-wolverine-batman-wolverine-superman-batman-wolverine-spiderman-wolverine-superman-spiderman-spiderman-spiderman-wolverine-batman-batman-batman-spiderman-wolverine-batman-superman-batman-wolverine-superman-wolverine-wolverine-spiderman-batman-superman-batman-superman-wolverine-superman-spiderman-spiderman-superman-wolverine-wolverine-spiderman-spiderman-wolverine-spiderman-batman-batman-superman-wolverine-spiderman-batman-superman-spiderman-superman-batman-spiderman-wolverine-wolverine-spiderman-batman-batman-superman-batman-wolverine-superman-superman-spiderman-wolverine-superman-superman-wolverine-spiderman-wolverine-batman-superman-batman-batman-spiderman-wolverine-superman-batman-spiderman-spiderman-wolverine-wolverine-wolverine-spiderman-superman-batman-wolverine-superman-spiderman-spiderman-batman-batman-superman-batman-wolverine-batman-superman"
  YAHOO_SLUG = "velociraptor-velociraptor-brachiosaur-tyrannosaur-velociraptor-tyrannosaur-diplodocus-diplodocus-tyrannosaur-tyrannosaur-velociraptor-diplodocus-velociraptor-brachiosaur-brachiosaur-diplodocus-diplodocus-velociraptor-velociraptor-brachiosaur-diplodocus-diplodocus-tyrannosaur-diplodocus-brachiosaur-velociraptor-velociraptor-tyrannosaur-velociraptor-brachiosaur-velociraptor-brachiosaur-brachiosaur-velociraptor-velociraptor-brachiosaur-tyrannosaur-diplodocus-diplodocus-velociraptor-tyrannosaur-tyrannosaur-diplodocus-tyrannosaur-brachiosaur-velociraptor-tyrannosaur-diplodocus-tyrannosaur-diplodocus-velociraptor-diplodocus-brachiosaur-brachiosaur-velociraptor-diplodocus-brachiosaur-brachiosaur-brachiosaur-brachiosaur-velociraptor-tyrannosaur-tyrannosaur-brachiosaur-velociraptor-diplodocus-diplodocus-brachiosaur-diplodocus-velociraptor-velociraptor-diplodocus-brachiosaur-velociraptor-brachiosaur-brachiosaur-velociraptor-brachiosaur-velociraptor-diplodocus-brachiosaur-diplodocus-tyrannosaur-brachiosaur-velociraptor-tyrannosaur-diplodocus-brachiosaur-velociraptor-brachiosaur-tyrannosaur-velociraptor-brachiosaur-velociraptor-brachiosaur-velociraptor-velociraptor-velociraptor-brachiosaur-diplodocus-brachiosaur-tyrannosaur-diplodocus-brachiosaur-tyrannosaur-velociraptor-diplodocus-velociraptor-velociraptor-diplodocus-diplodocus-tyrannosaur-brachiosaur-diplodocus-velociraptor-brachiosaur-velociraptor-diplodocus-tyrannosaur-velociraptor-velociraptor-tyrannosaur-brachiosaur-diplodocus-diplodocus-brachiosaur-brachiosaur-brachiosaur-diplodocus-diplodocus"
  
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
