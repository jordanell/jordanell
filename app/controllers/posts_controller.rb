class PostsController < ApplicationController
  def index
    @posts = Post.where(visible: true)
  end
end
