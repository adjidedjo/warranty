require 'test_helper'

class KonfirmasiDisplayControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get konfirmasi_display_index_url
    assert_response :success
  end

end
