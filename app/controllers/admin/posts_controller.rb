class Admin::PostsController < ApplicationController
  
  
  def show
    @post= Post.find(params[:id])
    @posts = Post.page(params[:page])
  end
  
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_path
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:name, :image, :caption, :music, :genre_id)
  end
  
  
end
