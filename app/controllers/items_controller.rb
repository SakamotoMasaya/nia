class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    if @item.save!
      # image_params.each do |image|
      #   @item.item_image.create(image: image, item_id: @item.id)
      # end
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

  # def image_params
  #   params.require(:item).permit(item_images_attributes: { image: [] })
  # end
end
