class DashboardsController < ApplicationController
  def show
    @customer_projects = Project.as_customer(current_user.id)
    @artist_projects = Project.as_artist(current_user.id)
  end
end
