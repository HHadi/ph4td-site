class TripsController < ApplicationController
  # GET /trips
  # GET /trips.json
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

  def index
    @trips = Trip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = current_user.trips.build(params[:trip])
    respond_to do |format|
      if @trip.save
        format.html { redirect_to root_url, 
        notice: 'Trip successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        @feed_items = []
        format.html { redirect_to root_url, 
        notice: 'Trip not created!' }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to root_url, 
      notice: 'Trip Successfully Deleted' }
      format.json { head :no_content }
    end
  end

  private

    def correct_user
      @trip = current_user.trips.find_by_id(params[:id])
      redirect_to root_url if @trip.nil?
    end
end
