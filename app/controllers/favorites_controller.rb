class FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    favorite = Favorite.new(user_id: current_user.id, team_id: params[:team_id])
    favorite.save
    redirect_to team_path(params[:team_id])
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, team_id: params[:team_id])
    favorite.destroy
    redirect_to team_path(params[:team_id])
  end
end
