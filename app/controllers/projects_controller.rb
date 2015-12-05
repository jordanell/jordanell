class ProjectsController < ApplicationController
  # Before filters
  before_filter :fetch_project, only: [:show]

  def index
    # Get all visible projects
    @projects = Project.where(visible: true)
  end

  def show
  end

  private

  def fetch_project
    @project = Project.find_by!(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    return error_404
  end
end
