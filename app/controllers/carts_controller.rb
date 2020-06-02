class CartsController < ApplicationController
  include Pagy::Backend

  # before_action :set_cart, only: [:create, :show, :edit, :update, :destroy]
  before_action :set_cart, only: %i[create destroy]
  before_action :authenticate_user!

  # Product.unscoped.where(:funded => 'true')

  # GET /article/ns
  # GET /articles.json
  def index

    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'shopping cart'

    @carts = Cart.where('user_id =?', current_user.id)
    @pagy, @carts = pagy(@carts)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'shopping cart'

  end

  # GET /articles/new
  def new
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'New shopping cart'

    @cart = Cart.new
  end

  # GET /articles/1/edit
  def edit
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'edit shopping cart'

  end

  def create
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'new shopping cart'

    @cart = Cart.new

    respond_to do |format|
      if @cart.save(carts_params)
        format.html { redirect_to @carts, notice: 'Product has been added to cart.' }
        format.json { render :show, status: :created, location: @carts_path }
      else
        format.html { render :new }
        format.json { render json: @carts.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Edit shopping cart'

    @cart = Cart.find(params[:id])
    if @cart.paid = true

      @cart = Cart.new

      respond_to do |format|
        if @cart.save(carts_params)
          format.html { redirect_to @carts, notice: 'Product has been added to cart.' }
          format.json { render :show, status: :created, location: @carts_path }
        else
          format.html { render :new }
          format.json { render json: @carts.errors, status: :unprocessable_entity }
        end
      end

    else
    @cart.update!(qty: params[:qty])
    end

    redirect_to carts_path
  end

  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Item in cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def carts_params
    # params.fetch(:product, {})
    # added qty
    params.require(:cart).permit(:qty)
  end

end
