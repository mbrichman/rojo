class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      redirect_to posts_url, notice: "Welcome to Rojo!"
      session[:user_id] = @user.id
    else
      redirect_to new_user_url, notice: "Please try again."

    end
  end

  def follow
    @follower = Follower.new
    @follower.user_id = params[:follower_id]
    @follower.follower_id = session[:user_id]

    if @follower.save
      redirect_to users_url
    else
      @users = User.all
      render 'index'
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      redirect_to users_url
    else
      redirect_to edit_user_url(params[:id]), notice: "Please try again."
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
        redirect_to users_url
      end
end
