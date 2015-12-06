class PostsController < ApplicationController
  # Before filters
  before_filter :fetch_post, only: [:show]

  def index
    # Get all visible posts
    @posts = Post.where(visible: true)
  end

  def show
  end

  private

  def fetch_post
    @post = Post.where(visible: true).find_by!(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    return render_error(404)
  end
end
