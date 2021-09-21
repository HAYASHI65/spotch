class DonationsController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @donation_object = DonationObject.new
  end

  def create
    @donation_object = DonationObject.new(donation_params)
    if @donation_object.valid?
      @donation_object.save
      redirect_to team_path(params[:team_id])
    else
      @team = Team.find(params[:team_id])
      render :new
    end
  end

  private
  def donation_params
    params.require(:donation_object).permit(:price, :text).merge(user_id: current_user.id, team_id: params[:team_id])
  end
end
