class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to team_path(@team.id)
    else
      render :edit
    end
  end

  private
  def team_params
    params.require(:team).permit(:image, :team_name, :sports_id, :group_id, :active_area_id, :active_day_id, :active_time_id, :place, :gender_ratio, :level_id, :profile).merge(user_id: current_user.id)
  end
end
