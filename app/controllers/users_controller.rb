class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @teams = @user.teams

    @team_applies = Apply.where(team_id: @user.teams)
    @self_applies = Apply.where(user_id: @user.id)
    @approves = Approve.where(user_id: @user.id)
  end

  def favorite
    @myfavorites = Favorite.where(user_id: current_user.id).order('created_at DESC')
    @favorited = Favorite.where(team_id: current_user.teams).order('created_at DESC')
  end
end
