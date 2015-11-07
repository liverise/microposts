class UsersController < ApplicationController
  
  def index
    @user = User.all
  end

  def show # 追加
    @user= User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user= User.find(params[:id])
  end
  
  def update
    @user= User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.follower_users
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :location, :profile, :password, :password_confirmation)
  end
end

