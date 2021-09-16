class FavoritesController < ApplicationController

  def create
    @team_favorite = Favorite.new(user_id: current_user.id, team_id: params[:team_id])
    if @team_favorite.save
      redirect_to team_path(params[:team_id])
    end
  end

  def destroy
    @team_favorite = Favorite.find_by(user_id: current_user.id, team_id: params[:team_id])
    @team_favorite.destroy
    redirect_to team_path(params[:team_id])
  end
end
