class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.admin? && user.authentificate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, success: "ログインしました"
    else
      flash.now[:error] = "ログイン失敗"
      render :new, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, info: "ログアウトしました"
  end
end
