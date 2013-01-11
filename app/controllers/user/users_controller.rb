class User::UsersController < ApplicationController
  # GET /user/users
  # GET /user/users.json
  def index
    @users = User::User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /user/users/1
  # GET /user/users/1.json
  def show
    @user = User::User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /user/users/new
  # GET /user/users/new.json
  def new
    if Settings.user.allow_registration
      @user = User::User.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
    else
      render 'errors/403'
    end
  end

  # GET /user/users/1/edit
  def edit
    @user = User::User.find(params[:id])
  end

  # POST /user/users
  # POST /user/users.json
  def create
    if Settings.user.allow_registration
      @user = User.new(params[:user])

      respond_to do |format|
        if @user.save
          format.html { redirect_to(user_users_path, :notice => 'Registration successfull.') }
          format.xml  { render :xml => @user, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    else
      render 'errors/403'
    end

  end

  # PUT /user/users/1
  # PUT /user/users/1.json
  def update
    @user = User::User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/users/1
  # DELETE /user/users/1.json
  def destroy
    @user = User::User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
