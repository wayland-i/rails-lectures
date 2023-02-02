class ProductionsController < ApplicationController
  before_action :set_production, only: %i[ show update destroy ]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  

  # GET /productions
  def index
    @productions = Production.all

    render json: @productions
  end

  # GET /productions/1
  def show


    # render json: @production


    production = Production.find(params[:id])
    render json: production, status: :ok

    # production = Production.find_by(id: params[:id])


    # rescue ActiveRecord::RecordNotFound => error
    #   render json: {message: error.message}



    # if production
    #   render json: production, status: :ok
    # else
    #   render json: {message: "this item was not found"}
    # end
    # byebug


    # render json: production

  end

  # POST /productions
  # def create
  #   @production = Production.new(production_params)

  #   if @production.save
  #     render json: @production, status: :created, location: @production
  #   else
  #     render json: @production.errors, status: :unprocessable_entity
  #   end
  # end

  def create
    
    production = Production.create(production_params)
    render json: production, status: :created

  end

  # PATCH/PUT /productions/1
  def update
    if @production.update(production_params)
      render json: @production
    else
      render json: {message: @production.errors.message}, status: :unprocessable_entity
    end
  end

  # DELETE /productions/1
  def destroy
    @production.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production
      @production = Production.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def production_params
      # params.require(:production).permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
      params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end

    def record_not_found(error)
      render json: { message: error.message }
    end
end
