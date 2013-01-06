require 'test_helper'

class SplashesControllerTest < ActionController::TestCase
    test "routes" do
    assert_generates "/", { :controller => "splash", :action => "index"}
  end
  # test "the truth" do
  #   assert true
  # end
end
