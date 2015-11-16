require 'test_helper'

class WishlistsControllerTest < ActionController::TestCase
  setup do
    @wishlist = wishlists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wishlists)
  end

  test "should create wishlist" do
    assert_difference('Wishlist.count') do
      post :create, wishlist: { crop_id: @wishlist.crop_id, user_id: @wishlist.user_id }
    end

    assert_redirected_to wishlist_path(assigns(:wishlist))
  end

  test "should destroy wishlist" do
    assert_difference('Wishlist.count', -1) do
      delete :destroy, id: @wishlist
    end

    assert_redirected_to wishlists_path
  end
end
