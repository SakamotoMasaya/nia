class BuyRequestController < ApplicationController
  before_action :authenticate_user, {only: [:index]}

  def index; end

  def create
    buyer = Item.find_by(id: params[:item_id])
    buyer.buyer_id = current_user.id
    if buyer.save!
      redirect_to root_url, success: '購入しました'
    else
      flash.now[:danger] = '購入に失敗しました'
      redirect_to item_path(id: params[:item_id]), danger: '購入に失敗しました'
    end
  end
end
