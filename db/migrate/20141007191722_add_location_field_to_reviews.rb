class AddLocationFieldToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :location, :string
  end
end
