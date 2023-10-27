class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: %i[ show edit update destroy ]

  # GET /cars or /cars.json
  def index
    if params[:query].present?
      @cars = Car.includes(:characteristics).search_by_model_and_brand(params[:query])
    else
      @cars = Car.includes(:characteristics).all.order(id: :desc)
    end
    @pagy, @electric_cars = pagy(@cars, items: 10)
  end

  # GET /cars/1 or /cars/1.json
  def show
    @car = Car.includes(:characteristics).find(params[:id])
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new( model: car_params[:model], brand: car_params[:brand], year: car_params[:year], 
                    autonomy: car_params[:autonomy], rental_price: car_params[:rental_price], 
                    image_car: car_params[:image_car] )
    respond_to do |format|
      if @car.save
        if car_params[:characteristic_ids].present?
          car_params[:characteristic_ids].each do |characteristic_id|
            CharacteristicCar.new(car_id: @car.id, characteristic_id: characteristic_id).save
          end
        end
        format.html { redirect_to car_url(@car), notice: "Car was successfully created." }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: "Car was successfully updated." }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:model, :brand, :year, :autonomy, :rental_price, :image_car, characteristic_ids: [])
    end
end
