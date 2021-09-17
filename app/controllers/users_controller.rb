class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @teams = @user.teams
  end
end
