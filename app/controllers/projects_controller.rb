class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  private

  def set_version

  def project_params
    params(:project).
  end
end
