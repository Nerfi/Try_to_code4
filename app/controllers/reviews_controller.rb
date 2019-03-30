class ReviewsController < ApplicationController

  def create
    @gym = gym.find(params[:gym_id])
    @review = Review.new(review_params)
    @review.gym = @gym
    if @review.save
      redirect_to gym_path(@gym)
    else
      render 'gyms/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

end
