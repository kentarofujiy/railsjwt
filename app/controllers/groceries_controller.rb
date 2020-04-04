class GroceriesController < ApplicationController
  before_action :require_login, except: [:index, :create, :show]
  before_action :set_grocery, only: [:show, :update, :destroy]

  # GET /groceries
  # GET /groceries.json
  def index
    userid = params[:user_id]
    @groceries = Grocery.where("user_id = ?", userid )
    render json: @groceries
  end

  # GET /groceries/1
  # GET /groceries/1.json
  def show
    @grocery = Grocery.find(params[:id])
    render json: @grocery, status: 200
  end

  # POST /groceries
  # POST /groceries.json
  def create
    @grocery = Grocery.new(grocery_params)
    #@grocery.user_id = 6
    puts 
    if @grocery.save
      render json: @grocery, status: 201 
        else
      render json: {errors: @grocery.errors}, status: 422
    end
  end

  # PATCH/PUT /groceries/1
  # PATCH/PUT /groceries/1.json
  def update
    if @grocery.update(grocery_params)
      render :show, status: :ok, location: @grocery
    else
      render json: @grocery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groceries/1
  # DELETE /groceries/1.json
  def destroy
    @grocery.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocery
      @grocery = Grocery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grocery_params
      params.require(:grocery).permit(:name, :user_id)
    end
end
