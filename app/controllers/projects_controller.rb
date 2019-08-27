class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update]

  def show
    #before action
    authorize @project

    @comment = Comment.new
    @color_swatch = ColorSwatch.new
    @last_version = @project.versions.last
    @comments = @last_version.comments if @last_version

    @version = @project.versions.build
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new
    if @project.save
      redirect_to @project
    else
      render 'dashboard_path'
    end
  end

  # private

  def set_project
    @project = Project.find(params[:id])
  end

  # def version_params
  #   params.require(:version).permit(:project_id, :work_in_progress)
  # end

  def project_params
    params.require(:project).permit(:customer_id, :artist_id, :brief, :name)
  end
end
