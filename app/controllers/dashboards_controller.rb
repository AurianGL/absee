class DashboardsController < ApplicationController
  def show
    @customer_projects = Project.as_customer(current_user.id).order(created_at: :desc)
    @artist_projects = Project.as_artist(current_user.id).order(created_at: :desc)
    authorize current_user
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

  private

  def project_params
    params.require(:project).permit(:brief, :customer_id, :artist_id)
  end
end
