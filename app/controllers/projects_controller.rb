class ProjectsController < ApplicationController
  include TruncateHtmlHelper

  helper_method :truncate_html

  # Before filters
  before_filter :fetch_project, only: [:show]
  before_filter :set_seo, only: [:show]

  def index
    # Get all visible projects
    @projects = Project.where(visible: true)
  end

  def show
  end

  private

  def fetch_project
    @project = Project.where(visible: true).find_by!(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    return render_error(404)
  end

  def set_seo
    set_meta_tags description: @project.name,
                  og: {
                    description:  ActionController::Base.helpers.strip_tags(truncate_html(@project.description, length: 100)),
                    url:          project_url(@project.slug)
                  },
                  twitter: {
                    description:  ActionController::Base.helpers.strip_tags(truncate_html(@project.description, length: 100)),
                    url:          project_url(@project.slug)
                  }
  end
end
