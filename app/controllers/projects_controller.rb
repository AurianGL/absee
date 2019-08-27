class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    authorize @project
  end

  private

  def set_version
  end

  def project_params
  end
end
