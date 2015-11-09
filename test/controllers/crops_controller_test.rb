require 'test_helper'

class CropsControllerTest < ActionController::TestCase
  setup do
    @crop = crops(:one)
    session[:user_id] = users(:one).id
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:crops)
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

  # test "should create crop" do
  #   assert_difference('Crop.count') do
  #     post :create, crop: { description: @crop.description, user_id: @crop.user_id,
  #       weight: @crop.weight, crop_type_id: @crop.crop_type_id, ripe_on: @crop.ripe_on,
  #       expires_on: @crop.expires_on}
  #   end
  #
  #   assert_redirected_to crop_path(assigns(:crop))
  # end

  test "should show crop" do
    get :show, id: @crop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crop
    assert_response :success
  end

  test "should update crop" do
    patch :update, id: @crop, crop: { description: @crop.description, user_id: @crop.user_id, weight: @crop.weight }
    assert_redirected_to crop_path(assigns(:crop))
  end

  test "should destroy crop" do
    assert_difference('Crop.count', -1) do
      delete :destroy, id: @crop
    end

    assert_redirected_to crops_path
  end
end
