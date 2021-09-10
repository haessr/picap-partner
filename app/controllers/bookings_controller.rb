class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy]
  # include PicapRequest
  # before_action :new_booking_request

  # GET /bookings or /bookings.json
  def index
    # @bookings = Booking.all
    begin
      @response = Booking.get_bookings
    rescue RestClient::Exception => exception
      @error = exception.response
    end
    # binding.pry
  end

  def local_records
    @bookings = Booking.all.reverse
  end

  # GET /bookings/1 or /bookings/1.json
  def show
    begin
      @response = Booking.get_booking(params[:id])
    rescue RestClient::Exception => exception
      @error = exception.response
    end
  end

  # GET /cancel_booking/1
  def cancel_booking
    begin
      @response = Booking.cancel_booking(params[:id])
    rescue RestClient::Exception => exception
      @error = exception.response
    end

    # binding.pry
    # redirect_to booking_url, id: params[:id]
    redirect_to root_path, notice: "Booking was cancelled"
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)
    begin
      @response = Booking.create_booking(booking_options)
      @booking.log = @response
      @booking.picap_id = @response["_id"]
      notice = "Booking was successfully created."
    rescue RestClient::Exception => exception
      @booking.log = exception.response
      alert = exception.response
    end

    respond_to do |format|
      if @booking.save
        format.html { redirect_to root_path, notice: notice, alert: alert }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:reference)
    end

    def booking_options
      { address_1: params[:address_1],
        lat_1: params[:lat_1],
        lon_1: params[:lon_1],
        address_2: params[:address_2],
        lat_2: params[:lat_2],
        lon_2: params[:lon_2]
      }
    end
end
