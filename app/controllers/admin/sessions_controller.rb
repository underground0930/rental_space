class Admin::SessionsController < ApplicationController
  def new
    if user_signed_in?
      redirect_to root_path, info: "既にログインしています"
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.admin? && user.valid_password?(params[:password])
      sign_in(user)
      redirect_to root_path, success: "ログインしました"
    else
      flash.now[:error] = "ログイン失敗"
      render :new, status: :unauthorized
    end
  end

  def destroy
    sign_out :user
    redirect_to root_path, info: "ログアウトしました"
  end
end
