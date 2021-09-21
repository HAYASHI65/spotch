class AppliesController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @team = Team.find(params[:team_id])
    @team_applies = Apply.where(team_id: @team.id)
  end

  def create
    @team_apply = Apply.new(user_id: current_user.id, team_id: params[:team_id])
    if @team_apply.save
      redirect_to team_path(params[:team_id])
    end
  end

  def destroy
    @team_apply = Apply.find_by(user_id: current_user.id, team_id: params[:team_id])
    @team_apply.destroy
    redirect_to team_path(params[:team_id])
  end

end
