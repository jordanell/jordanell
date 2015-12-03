class PostsController < ApplicationController
  def index
    @posts = Post.where(visible: true)
  end

  def show
    @post = Post.first
  end
end
