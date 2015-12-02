class ProjectsController < ApplicationController
  def index
    @projects = Project.where(visible: true)
  end

  def show
    @project = Project.first
  end
end
