class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @teams = @user.teams
  end

  def myfavorite
    @user = current_user
    @myfavorites = Favorite.where(user_id: @user.id)
  end
end
