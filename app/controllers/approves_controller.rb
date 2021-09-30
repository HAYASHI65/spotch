class ApprovesController < ApplicationController
  def create
    apply = Apply.find_by(user_id: approve_params[:user_id], team_id: approve_params[:team_id])
    approve = Approve.new(user_id: approve_params[:user_id], team_id: approve_params[:team_id])
    approve.save
    apply.destroy
    redirect_to team_applies_path(approve_params[:team_id])
  end

  def destroy
    apply = Apply.find_by(user_id: approve_params[:user_id], team_id: approve_params[:team_id])
    apply.destroy
    redirect_to team_applies_path(approve_params[:team_id])
  end

  private

  def approve_params
    params.permit(:user_id, :team_id)
  end
end
