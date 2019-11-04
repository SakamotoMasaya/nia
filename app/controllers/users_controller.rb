class UsersController < ApplicationController
  def new
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redairect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :signup
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
