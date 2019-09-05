class VersionsController < ApplicationController
  layout "versions"

  def create
    @version = Version.new(version_params)
    @project = Project.find(params[:project_id])
    @version.project = @project
    authorize @version
    if @version.save
      redirect_to project_path(@project)
    else
      redirect_to project_path(@project)
    end
  end

  def index
    @project = Project.find(params[:project_id])
    @versions = policy_scope(@project.versions.order(created_at: :desc))
  end

  def show
    @version = Version.find(params[:id])
    @project = Project.find(params[:project_id])
    @previous_versions = @project.versions.where("id <= ?", @version.id)
    @totoversion = @version.id - 1
    @pippaversion = @version.id + 1
    authorize @version
  end

  def update
    @version = Version.find(params[:id])
    @project = @version.project
    authorize @version

    if @version.update(version_params)
      redirect_to project_path(@project)
    else
      flash[:notice] = "couldn't update WIP"
      redirect_to project_path(@project)
    end
  end

  def edit
    Version.find(params[:version_id])
  end

  def version_params
    params.require(:version).permit(:photo, :name, :x, :y, :z, :canvas)
  end
end
