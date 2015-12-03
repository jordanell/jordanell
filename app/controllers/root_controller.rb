class RootController < ApplicationController
  def show
    # Get the featured projects and limit to 3
    @featured_projects = Project.where(featured: true)[0..3]
  end
end
