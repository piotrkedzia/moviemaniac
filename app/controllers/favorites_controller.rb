class FavoritesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = @user.movies
    render "movies/index"
  end

  def toggle
    authenticate_user!

    current_user.toggle_favorite(params[:movie_id])
    flash[:notice] = "Favorite toggled!"
    redirect_to :back
  end

end
