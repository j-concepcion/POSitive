class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_index, only: [:index]
  before_action :build_product, only: [:create]
  load_and_authorize_resource

  # GET /products
  def index
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:item_name, :category, :price)
    end

    # sanitize search parameters, consider implementing the ransackable methods
    def product_search_params
      params[:q].assert_valid_keys('s', 'item_name_cont', 'category_cont', 'price_cont') unless params[:q].blank?
      params[:q]
    end
    
    def set_index
      @q = Product.search(product_search_params, auth_object: current_user)
      @products = @q.result(distinct: true).accessible_by(current_ability).page params[:page]
    end
    
    def build_product
      @product = Product.new(product_params)
    end
end
