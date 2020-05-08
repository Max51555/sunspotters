class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    if @spot.save
      redirect_to spot_path(@spot)
    else
      render :new
    end
  end

  def index
   @spots = spot.all
      @spots = Spot.geocoded
    if params[:query].present?
      @spots = Spot.search_by_name_and_location(params[:query])
      @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { spot: spot })
      }
        end
      else
        @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { spot: spot })
      }
        end
    end

  end

  def show
    @spot = spot.find(params[:id])

  end


private

def spot_params
    params.require(:spot).permit(:title, :location, :description, photos: [])
end

end
