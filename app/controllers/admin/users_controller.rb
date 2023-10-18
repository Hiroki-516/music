class Admin::UsersController < ApplicationController
  
  def index
    @users = User.page(params[:page])
  end

  def show
    @user= User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end
  
  def withdraw
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "会員情報を変更しました。"
       redirect_to admin_user_path(@user.id)
    else
       render :edit
    end
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :status, :password, :email, :is_deleted, :profile_image)
  end
  
end
