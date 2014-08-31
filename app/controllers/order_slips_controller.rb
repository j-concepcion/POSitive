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
      @order_slip.order_slip_items.each do |osi|
        product = Product.find(osi.product_id)
        prod_item = product.item_name
        if (product.category == "Silog")
          prod_item.slice!("silog")
        end
        inv_item = Inventory.find_by_item_name(prod_item)
        inv_item.quantity = inv_item.quantity - osi.quantity
        inv_item.update_attribute(:quantity, inv_item.quantity)
      end
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
    @order_slip.order_slip_items.each do |osi|
        product = Product.find(osi.product_id)
        prod_item = product.item_name
        if (product.category == "Silog")
          prod_item.slice!("silog")
        end
        inv_item = Inventory.find_by_item_name(prod_item)
        inv_item.quantity = inv_item.quantity + osi.quantity
        inv_item.update_attribute(:quantity, inv_item.quantity)
    end
    @order_slip.destroy
    redirect_to order_slips_url, notice: 'Order slip was successfully destroyed.'
  end

  # def archive
  #   @order_slip.update_attribute(:open, false)
  #   redirect_to order_slips_url, notice: 'Order slip was successfully closed.'
  # end

  # def activate
  #   @order_slip.update_attribute(:open, true)
  #   redirect_to order_slips_url, notice: 'Order slip was successfully opened.'
  # end

  def split
    @order_slip = OrderSlip.find(params[:id])
    @new_os = OrderSlip.create!(:order_date=>@order_slip.order_date, :order_type=>@order_slip.order_type, :table_number=>10, :user_id=>@order_slip.user_id, :open=> @order_slip.open)
    params[:selected].each do |i|
      @new_os.order_slip_items << OrderSlipItem.find(i)
    end
    @new_os.save!
    redirect_to @new_os, notice: 'Order slip was successfully split.'
  end

  def merge
    @order_slip = OrderSlip.find(params[:id])
    tab = OrderSlip.find(params[:another_id])
    tab.order_slip_items.each do |i|
      @order_slip.order_slip_items.create(:quantity=>i.quantity, :order_slip_id=>@order_slip.id, :product_id=>i.product_id)
    end
    tab.destroy
    redirect_to @order_slip, notice: 'Order slips were successfully merged.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_slip
      @order_slip = OrderSlip.find(params[:id])
    end
 
    # Only allow a trusted parameter "white list" through.
    def order_slip_params
      params.require(:order_slip).permit(:order_type, :table_number, :takeout_number, :takeout_type, :order_date, :user_id, :open,
        order_slip_items_attributes: [:id, :product_id, :quantity, :_destroy])
    end

    # sanitize search parameters, consider implementing the ransackable methods
    def order_slip_search_params
      params[:q].assert_valid_keys('s', 'order_type_cont', 'table_number_cont', 'takeout_number_cont', 'takeout_type_cont', 'user_id_cont', 'open') unless params[:q].blank?
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
