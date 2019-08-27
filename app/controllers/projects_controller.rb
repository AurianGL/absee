class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def show
  end

  def create_version

  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
  end
end
