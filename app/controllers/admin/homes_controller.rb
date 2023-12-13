class Admin::HomesController < ApplicationController
  def top
    @posts = Post.page(params[:page]).order(created_at: :desc)
  end
end
