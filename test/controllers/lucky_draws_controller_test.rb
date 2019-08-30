require 'test_helper'

class LuckyDrawsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lucky_draw = lucky_draws(:one)
  end

  test "should get index" do
    get lucky_draws_url
    assert_response :success
  end

  test "should get new" do
    get new_lucky_draw_url
    assert_response :success
  end

  test "should create lucky_draw" do
    assert_difference('LuckyDraw.count') do
      post lucky_draws_url, params: { lucky_draw: {  } }
    end

    assert_redirected_to lucky_draw_url(LuckyDraw.last)
  end

  test "should show lucky_draw" do
    get lucky_draw_url(@lucky_draw)
    assert_response :success
  end

  test "should get edit" do
    get edit_lucky_draw_url(@lucky_draw)
    assert_response :success
  end

  test "should update lucky_draw" do
    patch lucky_draw_url(@lucky_draw), params: { lucky_draw: {  } }
    assert_redirected_to lucky_draw_url(@lucky_draw)
  end

  test "should destroy lucky_draw" do
    assert_difference('LuckyDraw.count', -1) do
      delete lucky_draw_url(@lucky_draw)
    end

    assert_redirected_to lucky_draws_url
  end
end
