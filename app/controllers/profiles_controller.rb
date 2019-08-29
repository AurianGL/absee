class ProfilesController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    authorize @profile
    @profile.user = current_user
    if @profile.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    authorize @profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:profile_id, :username, :customer, :user_id)
  end
end
