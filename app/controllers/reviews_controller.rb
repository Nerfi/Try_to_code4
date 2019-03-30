class ReviewsController < ApplicationController

     before_action :set_gym, only: [ :edit, :update, :destroy]


    def create
    @gym = Gym.find(params[:gym_id])
    @review = Review.new(review_params)
    @review.gym = @gym
    if @review.save
      respond_to do |format|
    format.html  {redirect_to restaurant_path(@restaurant)}
    format.js # will render 'app/views/reviews/create.js.erb'
    end
  else
    respond_to do  |format|
       format.html {render 'gyms/show'}
       format.js # idem
     end
    end
  end





  private



  def review_params
    params.require(:review).permit(:content)
  end


  def set_gym
    @gym = Gym.find(params[:id])
    authorize @gym

  end


end
