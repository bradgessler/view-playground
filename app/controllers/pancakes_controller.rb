class PancakesController < ApplicationController
  before_action :set_pancake, only: %i[ show edit update destroy ]


  # GET /pancakes or /pancakes.json
  def index
    @pancakes = Pancake.all
  end

  # GET /pancakes/1 or /pancakes/1.json
  def show
  end

  # GET /pancakes/new
  def new
    @pancake = Pancake.new
  end

  # GET /pancakes/1/edit
  def edit
  end

  # POST /pancakes or /pancakes.json
  def create
    @pancake = Pancake.new(pancake_params)

    respond_to do |format|
      if @pancake.save
        format.html { redirect_to pancake_url(@pancake), notice: "Pancake was successfully created." }
        format.json { render :show, status: :created, location: @pancake }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pancake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pancakes/1 or /pancakes/1.json
  def update
    respond_to do |format|
      if @pancake.update(pancake_params)
        format.html { redirect_to pancake_url(@pancake), notice: "Pancake was successfully updated." }
        format.json { render :show, status: :ok, location: @pancake }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pancake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pancakes/1 or /pancakes/1.json
  def destroy
    @pancake.destroy

    respond_to do |format|
      format.html { redirect_to pancakes_url, notice: "Pancake was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pancake
      @pancake = Pancake.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pancake_params
      params.require(:pancake).permit(:name, :description)
    end
end
