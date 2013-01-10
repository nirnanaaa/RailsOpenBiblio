class User::SessionsController < ApplicationController
  def new
    @user_session = UserSession.new
    render :login
  end
  def show
  
  end
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to account_url
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to new_user_session_url
  end
end
