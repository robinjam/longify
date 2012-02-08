require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  test "new" do
    get :new
    assert_response :success
  end
  
  test "create" do
    assert_difference("Link.count") do
      post :create, link: { theme: themes(:dinosaurs), uri: "http://www.something.com/" }
    end
    
    assert_equal "http://www.something.com", assigns(:link).uri
  end
  
  test "show" do
    get :show, id: links(:google)
    assert_response :success
    assert_equal links(:google), assigns(:link)
  end
  
  test "redirect" do
    @request.host = "superheroes.longify.local"
    get :redirect, id: links(:google).slug
    assert_redirected_to links(:google).uri
  end
end
