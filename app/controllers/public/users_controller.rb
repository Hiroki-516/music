class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def show
  end

  def edit
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
    params.require(:user).permit(:name, :introduction, :status, :password, :email, :is_deleted)
  end

end
