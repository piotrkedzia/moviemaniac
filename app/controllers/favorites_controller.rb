class FavoritesController < ApplicationController
  def index

  end

  def show
  end

  def edit
  end

  def create
  end

  def all
    @favorites = Favorite.all
  end
end
