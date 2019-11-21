class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.item_id = params[:item_id]
    if favorite.save
      redirect_to item_path(id: favorite.item_id), success: 'いいねしました'
    else
      redirect_to item_path(id: favorite.item_id), danger: 'いいねに失敗しました'
    end
  end

  def destroy
    unfavorite = Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
    if unfavorite.destroy
      redirect_to item_path(id: unfavorite.item_id), success: 'お気に入り解除しました'
    else
      redirect_to item_path(id: unfavorite.item_id), danger: '解除に失敗しました'
    end
  end
end
