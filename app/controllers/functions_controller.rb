class FunctionsController < ApplicationController
  before_action :set_function, only: [:show, :update, :destroy]

  # GET /functions
  def index
    @functions = Function.all

    render json: @functions
  end

  # GET /functions/1
  def show
    render json: @function
  end

  # POST /functions
  def create
    if params[:movie_id]
      @movie = Movie.find(params[:movie_id])
      if @function = @movie.functions.where(:day => params[:day].to_datetime).any?
        render json: {:mssg => "already exist"}
        return
      else
        @function = Function.new(function_params)
      end
    end

    if @function.save
      render json: @function, status: :created, location: @function
    else
      render json: @function.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /functions/1
  def update
    if @function.update(function_params)
      render json: @function
    else
      render json: @function.errors, status: :unprocessable_entity
    end
  end

  # DELETE /functions/1
  def destroy
    @function.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_function
      @function = Function.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def function_params
      params.require(:function).permit(:movie, :day, :num_chairs, :movie_id)
    end
end
