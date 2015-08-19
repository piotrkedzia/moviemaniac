class User < ActiveRecord::Base
  has_many :favorites
  has_many :movies, through: :favorites

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def toggle_favorite(movie_id)
    return nil unless movie = Movie.find_by_id(movie_id)
    favorite = favorites.find_by(movie_id: movie.id)

    if favorite
      favorite.destroy
    else
      favorite = self.favorites.create(movie_id: movie.id)
    end
  end
end
