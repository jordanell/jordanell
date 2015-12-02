class ProjectsController < ApplicationController
  def index
    @projects = Project.where(visible: true)
  end
end
