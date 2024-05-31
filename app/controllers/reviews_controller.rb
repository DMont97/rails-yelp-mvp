class ReviewsController < ApplicationController
  before_action :set_review, only: %i[new create]

  def index
  end

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_review
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
