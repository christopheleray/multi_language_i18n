# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @posts = Post.all
    @user = current_user
  end

  def contact; end

  def about; end
end
