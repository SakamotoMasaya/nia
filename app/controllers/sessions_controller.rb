class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      redirect_to root_path, success: 'ログインしました'
    else
      flash.now[danger] = 'ログインできませんでした'
      render :new
    end
  end

  private

  def log_in(user)
    session[:user_id] = user.id
  end
end
