class VolcanosController < ApplicationController
  before_action :set_volcano, only: %i[ show update destroy ]

  # GET /volcanos
  def index
    @volcanos = Volcano.page(params[:page]).per(20)
    
    render json: @volcanos
  end

  # GET /volcanos/1
  def show
    render json: @volcano
  end

  # POST /volcanos
  def create
    @volcano = Volcano.new(volcano_params)

    if @volcano.save
      render json: @volcano, status: :created, location: @volcano
    else
      render json: @volcano.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /volcanos/1
  def update
    if @volcano.update(volcano_params)
      render json: @volcano
    else
      render json: @volcano.errors, status: :unprocessable_entity
    end
  end

  # DELETE /volcanos/1
  def destroy
    @volcano.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volcano
      @volcano = Volcano.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def volcano_params
      params.expect(volcano: [ :volcano_name, :country, :latitude, :longitude, :elevation, :primary_volcano_type, :activity_evidence, :last_known_eruption, :year, :month, :day, :tsu, :eq, :vei, :deaths, :damage_mil, :houses_destroyed, :total_deaths, :total_damage_mil ])
    end
end
