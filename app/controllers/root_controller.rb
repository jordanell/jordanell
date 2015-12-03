class RootController < ApplicationController
  def show
    # Get the featured projects and limit to 3
    @featured_projects = Project.where(featured: true)[0..3]

    # Get the featured post and limit to first one
    @featured_post = Post.where(featured: true).first
  end
end
