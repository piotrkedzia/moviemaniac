class MoviesController < ApplicationController
  def index
    @movies = Movie.released.decorate
  end

  def show
    @movie = Movie.find(params[:id]).decorate
  end

  def edit
    @movie = Movie.find(params[:id]).decorate
  end

  def update
    @movie = Movie.find(params[:id]).decorate

    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie successfully updated!"
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new.decorate
  end

  def create
    # Addin new movie
    @movie = Movie.new(movie_params).decorate
    if @movie.save
      redirect_to @movie, notice: "Movie was successfully created!"
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, danger:"Movie was permanently deleated!!!"
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image)
  end
end

