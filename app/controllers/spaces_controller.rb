class SpacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @q = Space.ransack(params[:q])
    @pagy, @spaces = pagy(@q.result.with_attached_images.includes(:features).order(created_at: :desc))
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    if @space.save
      redirect_to @space, success: "成功しました"
    else
      flash.now[:error] = "失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @space = Space.with_attached_images.find(params[:id])
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
    space = Space.find(params[:id])
    if space.update(space_params)
      redirect_to space, success: "更新しました"
    else
      flash.now[:error] = "失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # レコードを１つ削除
  end

  private
  
  def space_params
    params.require(:space).permit(
      :name, :description, :address, :nearest_station, {space_type_ids:[]}, :longitude, :latitude, {feature_ids: []}, {images: []}, :rating)
  end

  def check_admin
    redirect_to(root_path, alert: "権限がありません") unless current_user&.admin?
  end

end
