class VersionsController < ApplicationController
  def create
    @version = Version.new(version_params)
    @project = Project.find(params[:project_id])
    @version.project = @project
    if @version.save
      redirect_to project_path(@project)
    else
      redirect_to project_path(@project)
    end
  end

  def version_params
    params.require(:version).permit(:work_in_progress)
  end
end
