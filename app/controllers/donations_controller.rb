class DonationsController < ApplicationController
  before_action :donation, only: :create

  def new
    @team = Team.find(params[:team_id])
    @donation_object = DonationObject.new
  end

  def create
    @donation_object = DonationObject.new(donation_params)

    if @donation_object.valid? # カード登録済みなれど金額が決済システムの範囲外の場合を弾く
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
      Payjp::Charge.create(    # Chargeオブジェクト:PAY.JP側であらかじめ用意されている支払い情報を生成するオブジェクト
        amount: @donation_object.price,
        customer: customer_token,
        currency: 'jpy'
      )

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

  def donation
    redirect_to new_card_path and return unless current_user.card.present?
  end
end
