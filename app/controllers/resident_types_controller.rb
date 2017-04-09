class ResidentTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resident_type, only: [:show, :edit, :update, :destroy]

  # GET /resident_types
  # GET /resident_types.json
  def index
    @resident_types = ResidentType.all
  end

  # GET /resident_types/1
  # GET /resident_types/1.json
  def show
  end

  # GET /resident_types/new
  def new
    @resident_type = ResidentType.new
  end

  # GET /resident_types/1/edit
  def edit
  end

  # POST /resident_types
  # POST /resident_types.json
  def create
    @resident_type = ResidentType.new(resident_type_params)

    respond_to do |format|
      if @resident_type.save
        format.html { redirect_to @resident_type, notice: 'Resident type was successfully created.' }
        format.json { render :show, status: :created, location: @resident_type }
      else
        format.html { render :new }
        format.json { render json: @resident_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resident_types/1
  # PATCH/PUT /resident_types/1.json
  def update
    respond_to do |format|
      if @resident_type.update(resident_type_params)
        format.html { redirect_to @resident_type, notice: 'Resident type was successfully updated.' }
        format.json { render :show, status: :ok, location: @resident_type }
      else
        format.html { render :edit }
        format.json { render json: @resident_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resident_types/1
  # DELETE /resident_types/1.json
  def destroy
    @resident_type.destroy
    respond_to do |format|
      format.html { redirect_to resident_types_url, notice: 'Resident type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resident_type
      @resident_type = ResidentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resident_type_params
      params.require(:resident_type).permit(:name)
    end
end
