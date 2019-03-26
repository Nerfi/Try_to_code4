class GymsController < ApplicationController
   before_action :set_gym, only: [:show, :edit, :update, :destroy]
   skip_before_action :authenticate_user!, only: :index


   def index
    @gyms = Gym.where.not(latitude: nil, longitude: nil)

    @markers = @gyms.map do |gym|
      {
        lat: gym.latitude,
        lng: gym.longitude,
        infoWindow: { content: render_to_string(partial: "/gyms/map_box", locals: { gym: gym }) },

        # Uncomment the above line if you want each of your markers to display a info window when clicked
        # (you will also need to create the partial "/flats/map_box")


        }
    end


     @gyms = policy_scope(Gym).order(created_at: :desc)
  end

  def show


  end

  def new
    @gym = Gym.new
    authorize @gym

  end

  def edit
    #esta linea la hemos sustituido por set_gym method
    #estar atento a esta line. puede que en un futuro sea molesta o no
#    @gym.edit(set_gym)


  end

  def create
    @gym = Gym.new(gym_params)
    @gym.save
    @gym.user = current_user
    authorize @gym

    if @gym.save
      redirect_to @gym , notice: 'your gym was created thanks!'
    else
      render :new
    end

  end

  def update
    @gym.update(gym_params)

    if @gym.update(gym_params)
      redirect_to @gym, notice: 'your gym was updated, thanks!'
    else
      render :edit
  end

  end

  def destroy
    @gym.destroy
    redirect_to gyms_path


  end

  private

  def set_gym
    @gym = Gym.find(params[:id])
    authorize @gym

  end

  def gym_params
    params.require(:gym).permit(:name, :description, :pricing, :user_id, :photo, :address)

  end



end
