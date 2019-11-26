class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.item_category_relations.build
    @item_image = @item.item_images.build
  end

  def create
    # @items = Item.create(params[:category_id])
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    if @item.save!
      # @item.item_category_relations.create
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
      item_category_relations_attributes: [:category_id]
    )
  end
end