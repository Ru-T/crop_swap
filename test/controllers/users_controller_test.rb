require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    session[:user_id] = users(:one).id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { description: @user.description, email: @user.email, name: @user.name, password: "password", phone_number: @user.phone_number, zip_code: @user.zip_code }
    end

    assert_redirected_to edit_user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { description: @user.description, email: @user.email, name: @user.name, password_digest: @user.password_digest, phone_number: @user.phone_number, zip_code: @user.zip_code }
    assert_redirected_to new_crop_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
