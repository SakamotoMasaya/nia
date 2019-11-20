class PagesController < ApplicationController
  def top
    @items = Item.all.order(created_at: :desc)
    @images = ItemImage.all
  end
end
