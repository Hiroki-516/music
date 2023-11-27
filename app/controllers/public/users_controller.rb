class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except:[:guest_sign_in]
  before_action :ensure_correct_user, only: [:update, :edit]
  before_action :ensure_guest_user, only: [:edit]


  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      # バリデーションついてる新規登録情報を以下に記載
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.status = User.statuses[:artist]
      user.introduction = ""
      # user.skip_confirmation!  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def favorites
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
    # ユーザーidが、このユーザーの、いいねのレコードを全て取得。post_idも一緒に持ってくる＝あるユーザーがいいねした記事をすべて持ってくる。
    favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end


  def index
    @users = User.where(status: "artist", is_deleted: false).order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
    if @user.is_deleted == true
      redirect_to users_path
    end
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


  def confirm_withdraw
   
  end
  
  def withdraw
    @user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    #セッション情報を全て削除
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    #退会後トップ画面に遷移
    redirect_to root_path
  end
  
  def search
    @users = User.where(status: "artist", is_deleted: false).search(params[:keyword]).page(params[:page]).per(10)
    render "index"
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

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
