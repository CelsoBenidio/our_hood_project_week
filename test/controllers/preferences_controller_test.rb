require 'test_helper'

class PreferencesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get preferences_new_url
    assert_response :success
  end

end
