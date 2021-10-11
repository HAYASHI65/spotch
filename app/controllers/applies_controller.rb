class AppliesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @team = Team.find(params[:team_id])
    @applies = Apply.where(team_id: params[:team_id])
    @approves = Approve.where(team_id: params[:team_id])
  end

  def create
    @team_apply = Apply.new(user_id: current_user.id, team_id: params[:team_id])
    redirect_to team_path(params[:team_id]) if @team_apply.save
  end

  def destroy
    @team_apply = Apply.find_by(user_id: current_user.id, team_id: params[:team_id])
    @team_apply.destroy
    redirect_to team_path(params[:team_id])
  end

  private

  def move_to_index
    @team = Team.find(params[:team_id])
    redirect_to root_path unless current_user.id == @team.user_id
  end
end
