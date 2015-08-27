class ReviewsController < ApplicationController
  expose(:movie)
  expose(:reviews, ancestor: :movie)
  expose(:review, attributes: :review_params)

  def create
    if review.save
      redirect_to movie_reviews_path(movie), notice: "Thanks for your review!"
    else
      render :new
    end
  end

  def update
    if review.save
      redirect_to movie_reviews_path(movie), notice: "Comment successfully edited"
    else
      render :edit
    end
  end

  def destroy
    review.destroy
    redirect_to movie_reviews_path(movie), danger: 'Review successfully deleted!!!'
  end

  private
  def review_params
    params.require(:review).permit(:name, :stars, :comment)
  end
end
