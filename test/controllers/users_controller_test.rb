require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @base_title = "Trener-Mkufunzi"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Zarejestruj się | #{@base_title}"
  end

end
