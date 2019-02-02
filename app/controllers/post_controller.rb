# frozen_string_literal: true

class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    post.valid?(@post)
    redirect_to user_post_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def post_valid?(post)
    if post.valid?
      post.save
      flash[:notice] = ""
    else
      flash[:alert] = post.errors.full_messages
  end
end
