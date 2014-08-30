class MarketFoodInventoriesController < ApplicationController
  before_action :set_market_food_inventory, only: [:show, :edit, :update, :destroy]
  before_action :set_index, only: [:index]
  before_action :build_market_food_inventory, only: [:create]
  load_and_authorize_resource

  # GET /market_food_inventories
  def index
  end

  # GET /market_food_inventories/1
  def show
  end

  # GET /market_food_inventories/new
  def new
  end

  # GET /market_food_inventories/1/edit
  def edit
  end

  # POST /market_food_inventories
  def create
    MarketFoodInventory.all.each do |food_item|
      if (food_item.item_name == @market_food_inventory.item_name)
        @market_food_inventory.quantity = @market_food_inventory.quantity + food_item.quantity
        food_item.destroy
      end
    end
    if @market_food_inventory.save
      redirect_to @market_food_inventory, notice: 'Market food inventory was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /market_food_inventories/1
  def update
    if @market_food_inventory.update(market_food_inventory_params)
      redirect_to @market_food_inventory, notice: 'Market food inventory was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /market_food_inventories/1
  def destroy
    @market_food_inventory.destroy
    redirect_to market_food_inventories_url, notice: 'Market food inventory was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market_food_inventory
      @market_food_inventory = MarketFoodInventory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def market_food_inventory_params
      params.require(:market_food_inventory).permit(:item_name, :quantity)
    end

    # sanitize search parameters, consider implementing the ransackable methods
    def market_food_inventory_search_params
      params[:q].assert_valid_keys('s', 'item_name_cont', 'quantity_cont') unless params[:q].blank?
      params[:q]
    end
    
    def set_index
      @q = MarketFoodInventory.search(market_food_inventory_search_params, auth_object: current_user)
      @market_food_inventories = @q.result(distinct: true).accessible_by(current_ability).page params[:page]
    end
    
    def build_market_food_inventory
      @market_food_inventory = MarketFoodInventory.new(market_food_inventory_params)
    end
end
