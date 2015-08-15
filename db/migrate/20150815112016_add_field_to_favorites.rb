class AddFieldToFavorites < ActiveRecord::Migration
  def change
    add_reference :favorites, :comment, index: true, foreign_key: true
  end
end
