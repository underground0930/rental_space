class SpacesController < ApplicationController

  def index
    # 一覧を表示
    @spaces = Space.all

    if params[:space_type_id].present?
      @spaces = @spaces.joins(:space_type_mappings).where(space_type_mappings: {space_type_id: params[:space_type_id]})
    end

    if params[:feature_ids].present?
      @spaces = @spaces.joins(:feature_mappings).where(feature_mappings: {feature_id: params[:feature_ids]}).distinct
    end

    if params[:keyword].present?
      @spaces = @spaces.where('spaces.name LIKE :keyword OR spaces.description LIKE :keyword OR spaces.address LIKE :keyword OR spaces.nearest_station LIKE :keyword',
        keyword: '%#{params[:keyword]}%'
      )
    end
  end

  def new
    # レコードを１つ作成するためのフォームを表示
  end

  def create
    # レコードを１つ作成
  end

  def show
    # レコードを１つ表示
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

end
