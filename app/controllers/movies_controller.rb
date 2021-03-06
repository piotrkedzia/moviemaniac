class MoviesController < ApplicationController
  expose_decorated(:movies) { Movie.released }
  expose_decorated(:movie, attributes: :movie_params)
  expose_decorated(:user)

  def update
    if movie.save
      redirect_to movie, notice: "Movie successfully updated!"
    else
      render :edit
    end
  end

  def create
    if movie.save
      redirect_to movie, notice: "Movie was successfully created!"
    else
      render :new
    end
  end

  def destroy
    movie.destroy
    redirect_to movies_path, danger:"Movie was permanently deleated!!!"
  end

  def user_favorites
    self.movies = user.movies.decorate
    render "movies/index"
  end

  def toggle
    authenticate_user!

    current_user.toggle_favorite(params[:movie_id])
    flash[:notice] = "Favorite toggled!"
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image)
  end
end

