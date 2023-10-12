class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where(status: "artist")
  end

  def show
    @user = User.find(params[:id])
     @posts = @user.posts.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end


  def comfirm_withdraw
    @user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    #セッション情報を全て削除
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    #退会後トップ画面に遷移
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :status, :password, :email, :is_deleted, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
