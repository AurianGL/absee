class ProjectsController < ApplicationController
  layout "moodboard"

  before_action :set_project, only: [:show, :update]
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def show
    authorize @project
    @last_version = @project.versions.last
    # @last_color_swatch = @last_version.color_swatch if @last_version.color_swatch
    z_array = []
    last_z(z_array)
    @z_index = z_array.max


    @comment = Comment.new
    @color_swatch = ColorSwatch.new
    # @last_version = @project.versions.last
    # @comments = @last_version.comments
    # @photo = @last_version.photo if @last_version.photo
    @version = Version.new
  end

  def new
    @project = Project.new
    authorize @project
  end

  def update
    @project.artist = User.find_by(email: params["q"])
    if @project.save
    flash[:notice] = 'Artist has been added'
      redirect_to project_path(@project)
    else
      flash[:notice] = 'error'
      redirect_to project_path(@project)
    end
  end


  def create
    @project = Project.new(project_params)
    authorize @project
    @project.customer = current_user
    #@project.artist = current_user
    if @project.save
      version_name = @project.name.gsub(' ', '_') + "_V0"
      @version = Version.new(name: version_name)
      @version.project = @project
      @version.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  # private

  def set_project
    @project = Project.find(params[:id])
  end

  # def version_params
  #   params.require(:version).permit(:project_id, :photo)
  # end

  def last_z(z_array)
    @project.comments.each do |comment|
      z_array << comment.z if comment.present?
    end
    z_array << @project.versions.last.z if @project.versions.last.present?
    z_array << @project.versions.last.color_swatch.z if @project.versions.last.color_swatch.present?
    z_array.delete(nil)
  end

  def project_params
    params.require(:project).permit(:customer_id, :artist_id, :brief, :name)
  end
end
