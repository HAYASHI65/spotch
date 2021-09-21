class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @teams = @user.teams

    @team_applies = Apply.where(team_id: @user.teams)
    @self_applies = Apply.where(user_id: @user.id)
  end

  def favorite
    @user = current_user
    @myfavorites = Favorite.where(user_id: @user.id)
  end
end
