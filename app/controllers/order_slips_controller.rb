class OrderSlipsController < ApplicationController
  before_action :set_order_slip, only: [:show, :edit, :update, :destroy]
  before_action :set_index, only: [:index]
  before_action :build_order_slip, only: [:create]
  load_and_authorize_resource

  # GET /order_slips
  def index
  end

  # GET /order_slips/1
  def show
  end

  # GET /order_slips/new
  def new
    @order_slip.order_date = Date.today
    @order_slip.order_slip_items.build
  end

  # GET /order_slips/1/edit
  def edit
    @order_slip.order_slip_items.build
  end

  # POST /order_slips
  def create
    if @order_slip.save
      redirect_to @order_slip, notice: 'Order slip was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /order_slips/1
  def update
    if @order_slip.update(order_slip_params)
      redirect_to @order_slip, notice: 'Order slip was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /order_slips/1
  def destroy
    @order_slip.destroy
    redirect_to order_slips_url, notice: 'Order slip was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_slip
      @order_slip = OrderSlip.find(params[:id])
    end
 
    # Only allow a trusted parameter "white list" through.
    def order_slip_params
      params.require(:order_slip).permit(:order_type, :table_number, :takeout_number, :order_date, :user_id,
        order_slip_items_attributes: [:id, :product_id, :quantity, :_destroy])
    end

    # sanitize search parameters, consider implementing the ransackable methods
    def order_slip_search_params
      params[:q].assert_valid_keys('s', 'order_type_cont', 'table_number_cont', 'takeout_number_cont', 'user_id_cont') unless params[:q].blank?
      params[:q]
    end
    
    def set_index
      @q = OrderSlip.search(order_slip_search_params, auth_object: current_user)
      @order_slips = @q.result(distinct: true).accessible_by(current_ability).page params[:page]
    end
    
    def build_order_slip
      @order_slip = OrderSlip.new(order_slip_params)
    end
end
