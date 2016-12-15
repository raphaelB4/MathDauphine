require 'test_helper'

class EleveControllerTest < ActionDispatch::IntegrationTest
  test "should get nouveau" do
    get eleve_nouveau_url
    assert_response :success
  end

end
