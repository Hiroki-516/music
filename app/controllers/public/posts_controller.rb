class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: "You have created book successfully."
    else
      render :new
    end
  end
  
  
  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new 
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
    params.require(:post).permit(:name, :image, :caption, :music)
  end
  
  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to books_path
    end
  end
end
