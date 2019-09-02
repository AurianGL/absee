class ColorSwatchesController < ApplicationController

  def create
    @color_swatch = ColorSwatch.new(color_swatch_params)
    @version = Version.find(params[:version_id])
    @project = @version.project
    @color_swatch.version = @version
    @color_swatch.artist_as = @project.artist
    authorize @color_swatch

    if @color_swatch.save!
      flash[:notice] = 'your color swatch has been added'
      redirect_to project_path(@project)
    else
      flash[:notice] = 'error'
      redirect_to project_path(@project)
    end
  end

  def update
    @color_swatch = ColorSwatch.find(params[:id])
    @version = Version.find(params[:version_id])
    @project = @version.project
    authorize @color_swatch

    if @color_swatch.update(color_swatch_params)
      redirect_to project_path(@project)
    else
      flash[:notice] = "couldn't update color swatch"
      redirect_to project_path(@project)
    end
  end

  def edit
    @color_swatch = ColorSwatch.find(params[:id])
  end

  private

  def color_swatch_params
    params.require(:color_swatch).permit(:color_1, :color_2, :color_3, :color_4, :color_5)
  end


end
