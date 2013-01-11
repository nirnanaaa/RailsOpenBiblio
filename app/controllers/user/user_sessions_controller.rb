class User::UserSessionsController < ApplicationController
  respond_to :html, :json
  
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @user_session }
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to(root_path, :notice => 'Login Successful') }
        format.json { render json: @user_session, :status => :created, :location => @user_session  }
      else
        format.html { render :action => "new" }
        format.json  { render json: @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to(root_path, :notice => 'Goodbye!') }
      format.json { render json: ["ok"] }
    end
  end
end
