class ApprovesController < ApplicationController

  def create
    approve = Approve.new(user_id: approve_params[:user_id], team_id: approve_params[:team_id])
    approve.save
    redirect_to root_path
  end

  def destroy
    apply = Apply.find_by(user_id: approve_params[:user_id], team_id: approve_params[:team_id])
    apply.destroy
    redirect_to root_path
  end

  private
  def approve_params
    params.permit(:user_id, :team_id)
  end
end