class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    if @item.save!
      redirect_to root_url, success: '出品しました'
    else
      flash.now[:danger] = '出品に失敗しました'
      render :new
    end
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :discription, :price)
  end
end
