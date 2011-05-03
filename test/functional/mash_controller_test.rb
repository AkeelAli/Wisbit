require 'test_helper'

class MashControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
