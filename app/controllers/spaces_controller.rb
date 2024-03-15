class SpacesController < ApplicationController

  def index
    # 一覧を表示
    @spaces = Space.all
    if params[:space_type_ids].present?
      @spaces = @spaces.joins(:space_type_mappings).where(space_type_mappings: {space_type_id: params[:space_type_id]})
    end

    if params[:feature_ids].present? && !params[:feature_ids].all?(&:blank?)
      @spaces = @spaces.joins(:feature_mappings).where(feature_mappings: {feature_id: params[:feature_ids]}).distinct
    end

    if params[:keyword].present?
      @spaces = @spaces.where('spaces.name LIKE :keyword OR spaces.description LIKE :keyword OR spaces.address LIKE :keyword OR spaces.nearest_station LIKE :keyword',
        keyword: '%#{params[:keyword]}%'
      )
    end

    @pagy, @spaces = pagy(@spaces)
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
    @space = Space.find(params[:id])
  end

  def edit
    # レコードを１つ編集するためのフォームを表示
  end

  def update
    # レコードを１つ編集
  end

  def destroy
    # レコードを１つ削除
  end

  private
  
  def space_params
    params.require(:space).permit(
      :name, :description, :address, :nearest_station, {space_type_ids:[]}, 
      :longitude, :latitude, {feature_ids: []}, {images: []})
  end

end
