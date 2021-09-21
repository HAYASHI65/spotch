class ApprovesController < ApplicationController

  def create
    team_apply = Apply.find_by(params[:team_id])
    approve = Approve.new(user_id: team_apply.user_id, team_id: team_apply.team_id)
    approve.save
    redirect_to root_path
  end

  def destroy
    team_apply = Apply.find_by(params[:team_id])
    approve = Approve.new(user_id: team_apply.user_id, team_id: team_apply.team_id)
    approve.destroy
    redirect_to root_path
  end
end