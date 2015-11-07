require 'test_helper'

class TradesControllerTest < ActionController::TestCase
  setup do
    @trade = trades(:one)
    session[:user_id] = users(one).id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trade" do
    assert_difference('Trade.count') do
      post :create, trade: { accepted: @trade.accepted, consumer_id: @trade.consumer_id, crop_id: @trade.crop_id, message: @trade.message, message_response: @trade.message_response, trade_type_id: @trade.trade_type_id }
    end

    assert_redirected_to trade_path(assigns(:trade))
  end

  test "should show trade" do
    get :show, id: @trade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trade
    assert_response :success
  end

  test "should update trade" do
    patch :update, id: @trade, trade: { accepted: @trade.accepted, consumer_id: @trade.consumer_id, crop_id: @trade.crop_id, message: @trade.message, message_response: @trade.message_response, trade_type_id: @trade.trade_type_id }
    assert_redirected_to trade_path(assigns(:trade))
  end

  test "should destroy trade" do
    assert_difference('Trade.count', -1) do
      delete :destroy, id: @trade
    end

    assert_redirected_to trades_path
  end
end
