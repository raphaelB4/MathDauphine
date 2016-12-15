require 'test_helper'

class PageStatiqueControllerTest < ActionDispatch::IntegrationTest
  test "should get hall" do
    get page_statique_hall_url
    assert_response :success
  end

end
