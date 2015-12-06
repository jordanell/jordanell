class PostsController < ApplicationController
  include TruncateHtmlHelper

  helper_method :truncate_html

  # Before filters
  before_filter :fetch_post, only: [:show]
  before_filter :set_seo, only: [:show]

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

  def set_seo
    set_meta_tags description: @post.title,
                  og: {
                    description:  ActionController::Base.helpers.strip_tags(truncate_html(@post.body, length: 100)),
                    url:          post_url(@post.slug)
                  },
                  twitter: {
                    description:  ActionController::Base.helpers.strip_tags(truncate_html(@post.body, length: 100)),
                    url:          post_url(@post.slug)
                  }
  end
end
