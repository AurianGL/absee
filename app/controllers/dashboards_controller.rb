class DashboardsController < ApplicationController
  def show
    all_projects
  end

  def all_projects
    @projects = current_user.projects
  end
end
