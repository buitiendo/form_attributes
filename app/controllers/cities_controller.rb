class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  def index
    @cities = City.all
  end

  def show; end

  def new
    @city = City.new
    @city.districts.build
  end

  def edit;end

  def create
    @city = City.new city_params
    if @city.save
      flash[:success] = "Create successfully!"
      redirect_to cities_url
    else
      render :new
    end
  end

  def update
    if @city.update_attributes city_params 
      flash[:success] = "city updated"
      redirect_to @city
    else
      render :edit
    end
  end

  def destroy
    begin
      @city.destroy!
      flash[:success] = "City deleted"
    rescue
      flash[:danger] = "Cannot delete city"
    end
    redirect_to cities_url
  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name, districts_attributes: [:id, :name, :_destroy])
    end
end
