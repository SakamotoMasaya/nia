class MypagesController < ApplicationController
  def top
    @user = User.find_by(id: current_user.id)
  end
end
