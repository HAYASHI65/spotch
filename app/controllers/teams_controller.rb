class TeamsController < ApplicationController

before_action :authenticate_user!, except: :index
before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all.order("created_at DESC")
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
    @comment = Comment.new
    @comments = @team.comments.includes(:user)
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to team_path(@team.id)
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to root_path
  end

  private
  def team_params
    params.require(:team).permit(:image, :team_name, :sports_id, :group_id, :active_area_id, :active_day_id, :active_time_id, :place, :gender_ratio, :level_id, :profile).merge(user_id: current_user.id)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
