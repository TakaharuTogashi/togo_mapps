class TogosController < ApplicationController
  before_action :set_togo, only: [:show, :edit, :update, :destroy]

  # GET /togos
  # GET /togos.json
  def index
    @togos = Togo.all
    @hash = Gmaps4rails.build_markers(@togos) do |togo, marker|
      marker.lat togo.latitude
      marker.lng togo.longitude
      marker.infowindow togo.place
      marker.json({place: togo.place})
    end
    render :template => "togos/index"
  end

  # GET /togos/1
  # GET /togos/1.json
  def show
    @hash = Gmaps4rails.build_markers(@togo) do |togo, marker|
      marker.lat togo.latitude
      marker.lng togo.longitude
      marker.infowindow togo.place
      marker.json({place: togo.place})
    end
  end

  # GET /togos/new
  def new
    @togo = Togo.new
  end

  # GET /togos/1/edit
  def edit
  end

  # POST /togos
  # POST /togos.json
  def create
    @togo = Togo.new(togo_params)

    respond_to do |format|
      if @togo.save
        format.html { redirect_to @togo, notice: 'Togo was successfully created.' }
        format.json { render :show, status: :created, location: @togo }
      else
        format.html { render :new }
        format.json { render json: @togo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /togos/1
  # PATCH/PUT /togos/1.json
  def update
    respond_to do |format|
      if @togo.update(togo_params)
        format.html { redirect_to @togo, notice: 'Togo was successfully updated.' }
        format.json { render :show, status: :ok, location: @togo }
      else
        format.html { render :edit }
        format.json { render json: @togo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /togos/1
  # DELETE /togos/1.json
  def destroy
    @togo.destroy
    respond_to do |format|
      format.html { redirect_to togos_url, notice: 'Togo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_togo
      @togo = Togo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def togo_params
      params.require(:togo).permit(:place, :memo, :address, :latitude, :longitude)
    end
end
