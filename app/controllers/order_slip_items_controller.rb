class OrderSlipItemsController < ApplicationController
  before_action :set_order_slip_item, only: [:show, :edit, :update, :destroy]
  before_action :set_index, only: [:index]
  before_action :build_order_slip_item, only: [:create]
  load_and_authorize_resource

  # GET /order_slip_items
  def index
  end

  # GET /order_slip_items/1
  def show
  end

  # GET /order_slip_items/new
  def new
  end

  # GET /order_slip_items/1/edit
  def edit
  end

  # POST /order_slip_items
  def create
    if @order_slip_item.save
      redirect_to @order_slip_item, notice: 'Order slip item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /order_slip_items/1
  def update
    if @order_slip_item.update(order_slip_item_params)
      redirect_to @order_slip_item, notice: 'Order slip item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /order_slip_items/1
  def destroy
    @order_slip_item.destroy
    redirect_to order_slip_items_url, notice: 'Order slip item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_slip_item
      @order_slip_item = OrderSlipItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_slip_item_params
      params.require(:order_slip_item).permit(:quantity, :product_id)
    end

    # sanitize search parameters, consider implementing the ransackable methods
    def order_slip_item_search_params
      params[:q].assert_valid_keys('s', 'quantity_cont') unless params[:q].blank?
      params[:q]
    end
    
    def set_index
      @q = OrderSlipItem.search(order_slip_item_search_params, auth_object: current_user)
      @order_slip_items = @q.result(distinct: true).accessible_by(current_ability).page params[:page]
    end
    
    def build_order_slip_item
      @order_slip_item = OrderSlipItem.new(order_slip_item_params)
    end
end
