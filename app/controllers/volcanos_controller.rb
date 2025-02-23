class VolcanosController < ApplicationController
  # before_action :doorkeeper_authorize!, only: %i[create update destroy]
  before_action :set_volcano, only: %i[show update destroy]

  def index
    @volcanos = Rails.cache.fetch("volcanos_page_#{params[:page]}", expires_in: ENV.fetch("CACHE_EXPIRY") { 6.hours }) do
      Volcano.page(params[:page]).per(20).to_a
    end
    render json: @volcanos
  end
  
  # GET /volcanos/1
  def show
    @volcano = Rails.cache.fetch("volcano_#{params[:id]}", expires_in: ENV.fetch("CACHE_EXPIRY") { 6.hours }) do
      Volcano.find(params[:id])
    end
    render json: @volcano
  end

  # POST /volcanos
  def create
    @volcano = Volcano.new(volcano_params)

    if @volcano.save
      Rails.cache.delete_matched("volcanos_page_*")
      render json: @volcano, status: :created, location: @volcano
    else
      render json: @volcano.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /volcanos/1
  def update
    if @volcano.update(volcano_params)
      Rails.cache.delete("volcano_#{params[:id]}")
      Rails.cache.delete_matched("volcanos_page_*")
      render json: @volcano
    else
      render json: @volcano.errors, status: :unprocessable_entity
    end
  end

  # DELETE /volcanos/1
  def destroy
    @volcano.destroy!
    Rails.cache.delete("volcano_#{params[:id]}")
    Rails.cache.delete_matched("volcanos_page_*")
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_volcano
    @volcano = Volcano.find_by(id: params[:id])
    return render json: { error: 'Volcano not found' }, status: :not_found unless @volcano
  end
  

  # Only allow a list of trusted parameters through.
  def volcano_params
    params.require(:volcano).permit(:volcano_name, :country, :latitude, :longitude, :elevation, 
                                    :primary_volcano_type, :activity_evidence, :last_known_eruption, 
                                    :year, :month, :day, :tsu, :eq, :vei, :deaths, :damage_mil, 
                                    :houses_destroyed, :total_deaths, :total_damage_mil)
  end
end
