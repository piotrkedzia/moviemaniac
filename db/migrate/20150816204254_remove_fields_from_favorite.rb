class RemoveFieldsFromFavorite < ActiveRecord::Migration
  def change
    remove_column :favorites, :title, :string
    remove_column :favorites, :description, :string
    remove_column :favorites, :comment_id, :integer
  end
end
