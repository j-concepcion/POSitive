class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  before_action :set_index, only: [:index]
  before_action :build_inventory, only: [:create]
  load_and_authorize_resource

  # GET /inventories
  def index
  end

  # GET /inventories/1
  def show
  end

  # GET /inventories/new
  def new
    @inventory.date_purchased = Date.today
    @inventory.expiration_date = Date.today + 7.days
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories
  def create
    if @inventory.save
      redirect_to @inventory, notice: 'Inventory was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /inventories/1
  def update
    if @inventory.update(inventory_params)
      redirect_to @inventory, notice: 'Inventory was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /inventories/1
  def destroy
    @inventory.destroy
    redirect_to inventories_url, notice: 'Inventory was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inventory_params
      params.require(:inventory).permit(:item_name, :quantity, :buying_price, :selling_price, :date_purchased, :expiration_date, :waste_age)
    end

    # sanitize search parameters, consider implementing the ransackable methods
    def inventory_search_params
      params[:q].assert_valid_keys('s', 'item_name_cont', 'quantity_cont', 'buying_price_cont', 'selling_price_cont', 'date_purchased_cont', 'expiration_date_cont', 'waste_age_cont') unless params[:q].blank?
      params[:q]
    end
    
    def set_index
      @q = Inventory.search(inventory_search_params, auth_object: current_user)
      @inventories = @q.result(distinct: true).accessible_by(current_ability).page params[:page]
    end
    
    def build_inventory
      @inventory = Inventory.new(inventory_params)
    end
end