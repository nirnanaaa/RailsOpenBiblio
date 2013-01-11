class User::StatsController < ApplicationController
  access_control do
    action :index do
      allow logged_in
    end
  end
  
  def index
    current_user = UserSession.find
    
    if current_user
      @user = current_user.record
    else
      render 'errors/404'
    end
    
  end
end
