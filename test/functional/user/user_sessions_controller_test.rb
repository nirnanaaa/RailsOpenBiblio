require 'test_helper'

class User::UserSessionsControllerTest < ActionController::TestCase
  setup do
    @user_user_session = user_user_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_user_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_user_session" do
    assert_difference('User::UserSession.count') do
      post :create, user_user_session: @user_user_session.attributes
    end

    assert_redirected_to user_user_session_path(assigns(:user_user_session))
  end

  test "should show user_user_session" do
    get :show, id: @user_user_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_user_session
    assert_response :success
  end

  test "should update user_user_session" do
    put :update, id: @user_user_session, user_user_session: @user_user_session.attributes
    assert_redirected_to user_user_session_path(assigns(:user_user_session))
  end

  test "should destroy user_user_session" do
    assert_difference('User::UserSession.count', -1) do
      delete :destroy, id: @user_user_session
    end

    assert_redirected_to user_user_sessions_path
  end
end
