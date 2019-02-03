# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    post_valid?(@post, current_user)
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def post_valid?(post, user)
    post.user_id = user.id
    if post.valid?
      post.save
      flash[:notice] = t(:valid_post)
    else
      flash[:alert] = post.errors.full_messages
    end
  end
end
