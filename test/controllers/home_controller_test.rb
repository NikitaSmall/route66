require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get "see/:album"
    assert_response :success
  end

  test "should get about" do
    get "about"
    assert_response :success
  end

  test "should get contacts" do
    get "contacts"
    assert_response :success
  end

end
