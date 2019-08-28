class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update]
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def show
    authorize @project

    @comment = Comment.new
    @color_swatch = ColorSwatch.new
    @last_version = @project.versions.last
    @comments = @last_version.comments
    @last_color_swatch = @last_version.color_swatch
    @work_in_progress = @last_version.work_in_progress
    @version = @project.versions.build
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    @project.customer = current_user
    if @project.save
      version_name = @project.name.gsub(' ', '_') + "_V0"
      @version = Version.new(name: version_name)
      @version.project = @project
      @version.save
      redirect_to @project
    else
      render :new
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
