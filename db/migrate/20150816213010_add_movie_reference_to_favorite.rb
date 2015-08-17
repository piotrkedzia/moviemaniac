class AddMovieReferenceToFavorite < ActiveRecord::Migration
  def change
    add_reference :favorites, :movie, index: true, foreign_key: true
  end
end
