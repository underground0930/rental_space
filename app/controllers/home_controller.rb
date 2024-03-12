class HomeController < ApplicationController
  def index
    @space_types = SpaceType.all.pluck(:name)
  end
end
