class FavoritesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = @user.movies
    render "movies/index"
  end

end
