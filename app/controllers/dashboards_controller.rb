class DashboardsController < ApplicationController
  def show
    all_projects
  end

  def create
    @project = current_user.projects.create!(project_params)

    if @project.save

    else
      render 'new'
    end
  end

  def new
    @project = Project.new
  end

  def all_projects
    @projects = current_user.projects
  end

  private

  def project_params
    params.require(:project).permit(:brief, :customer_id, :artist_id)
  end
end
