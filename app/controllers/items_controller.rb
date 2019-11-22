class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item_image = @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    if @item.save!
      params[:item_images]['image'].each do |a|
        @item_image = @item.item_images.create!(image: a)
      end
      redirect_to root_url, success: '出品しました'
    else
      flash.now[:danger] = '出品に失敗しました'
      render :new
    end
  end

  def show
    @item = Item.find_by(id: params[:id])
    @images = ItemImage.where(item_id: @item.id).order(id: :desc)
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :discription,
      :price,
      item_images_attributes: [:image],
      category_ids: []
    )
  end
end
