require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get email:string" do
    get :email:string
    assert_response :success
  end

  test "should get comment:text" do
    get :comment:text
    assert_response :success
  end

  test "should get show_email:bool" do
    get :show_email:bool
    assert_response :success
  end

end
