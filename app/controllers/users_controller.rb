class UsersController < ApplicationController

  
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.password_digest = params[:password_digest]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      redirect_to "/users/#{ @user.id }"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    @logged = User.find_by(id: session['user_id'])
    if @logged.username != @user.username
      redirect_to "/needlogin", :notice => "You can only edit your own page!"
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.username = params[:username]
    @user.password_digest = params[:password_digest]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    if @user.save
      redirect_to "/users/#{ @user.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy


    redirect_to "/users"
  end
  
  def login
  end
  
  def sign_in
    session['username'] = params['username']
    redirect_to '/users/login'
  end
  
  def sign_out
    session['username'] = nil
    redirect_to '/users/login'
  end
  
end
