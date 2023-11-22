class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # 投稿した本文を Language.get_data(list_params[:body]) でAPI側に渡しています。→返ってきた値をもとに採点
    #@post.score = Language.get_data(post_params[:caption])
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: "You have created post successfully."
    else
      render :new
    end
  end


  def index

    #ジャンル一覧表示
    @genres = Genre.all
    #音楽投稿一覧表示
    #クリエパラメータ(genre_id)をとりだす
    if @genre_id = params[:genre_id]
      #genre_idが同じものを全てとりだす
      posts = Post.joins(:user).where(genre_id: @genre_id, users: { is_deleted: 'false' }).order(created_at: :desc)
      @posts_count = posts.count
      @posts = posts.page(params[:page]).per(10)
    #なければ全てとりだす
    elsif post_name = params[:post_name]
      @posts_count = Post.where("name LIKE ?","%"+ post_name + "%").count
      @posts = Post.joins(:user).where("posts.name LIKE ? AND users.is_deleted = false","%"+ post_name + "%").order(created_at: :desc).page(params[:page]).per(10)
    else
      @posts_count = Post.all.count
      @posts = Post.joins(:user).where(users: { is_deleted: 'false' }).order(created_at: :desc).page(params[:page]).per(10)
    end
  end


  def show
    #ジャンル一覧表示
    @genres = Genre.all
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    # 投稿一つのIDに対してのコメントと表記したいため（post_id: @post.id）と表記している
    @post_comments = PostComment.joins(:user).where(post_id: @post.id, users: { is_deleted: 'false'})
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end


  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/posts'
  end


  private

  def post_params
    params.require(:post).permit(:name, :image, :caption, :music, :genre_id)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
end
