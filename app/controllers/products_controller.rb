
class ProductsController < ApplicationController

  include Pagy::Backend

 #before_action :set_product, only: %i[show edit update destroy]
 before_action :set_product, only: [ :show, :edit, :update, :destroy ]
 # before_action  :authenticate_user!

  # GET /products
  # GET /products.json
  def index

    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'products'

    @search = Product.published.search(params[:query] )
    @total_products = Product.published.count
    require 'time'

    todaydate = Time.new

    todaydate = todaydate.year.to_s + '-' + todaydate.month.to_s + '-' + todaydate.day.to_s
    if !params[:query].blank?
      @search = @search.records.where('draft = ? and active = ? and funded = ? and startdate < ? and enddate > ?', false , true, false , todaydate , todaydate )
    end
    @searchtotal = @search.count
    @products = @search
    @pagy, @a = Pagy.new( count: @products.count ,page: params[:page].blank? ? 1 : params[:page])
    @products = @products[@pagy.offset, @pagy.items]
  end

  def show
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'product'
    add_breadcrumb @product.title

   @product = Product.find_by_id(params[:id])

  # insert comments here...
   commontator_thread_show(@product)
  # @comments = @product.comments.with_state([:draft, :published])

   impressionist(@product)

   @photo = @product.photos.where('enabled' => true)

   @taken = Cart.where('product_id' => @product).sum(:qty)
   @remaining = @product.qty - @taken

   if @remaining == 1
    flash.now[:warning] = 'This is the last remaining product required to complete the group order.  By adding it to your cart, it will complete the order for the campaign.'
  end

  if @remaining == 0
     flash.now[:warning]= 'All gone!'

    @product.funded = 'true'
    @product.save!
    cart = Cart.where(product_id: @product.id).update_all(processing: true)

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Product was successfully funded.' }
      format.json { render :show, status: :created, location: @product }
    end

    # find all users in this successful campaign
    user_id = Cart.where(product_id: @product.id).pluck('DISTINCT(user_id)')
    user_id.each do |id|
      @user = User.find_by_id(id)
      #SuccessfulCampaignMailer.with(user: @user).successful_campaign_email.deliver_now
      SuccessfulCampaignMailer.with(user: @user).successful_campaign_email.deliver_now
    end

end
end

  # GET /products/new
  def new
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'New product'
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Edit product'
  end

  # POST /products
  # POST /products.json
  def create
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'New product'

    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }

      else
        puts @product.errors.messages
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_to_cart

#  if Cart.where(([user_id: current_user.id, product_id: params[:id] ]).blank? ).or(Cart.where( paid: true ))
 #where("paid = ?", "true")

 already = Cart.where(user_id: current_user.id , product_id: params[:id]).last

  if (already.blank?)

      @cart = Cart.new(user_id: current_user.id, product_id: params[:id], qty: params[:qty])

      respond_to do |format|
        if @cart.save

          format.html { redirect_back fallback_location: root_path, notice: 'Product was successfully added to cart.' }
          format.json { render :show, status: :created, location: @cart }
        else
          format.html { render :new }
          format.json { render json: @cart.errors, status: :unprocessable_entity }
        end
      end

    else
     if already.paid == true
       @cart = Cart.new(user_id: current_user.id, product_id: params[:id], qty: params[:qty])

       respond_to do |format|
         if @cart.save

           format.html { redirect_back fallback_location: root_path, notice: 'Product was successfully added to cart.' }
           format.json { render :show, status: :created, location: @cart }
         else
           format.html { render :new }
           format.json { render json: @cart.errors, status: :unprocessable_entity }
         end
       end

     else

      @cart = Cart.find_by(user_id: current_user.id, product_id: params[:id])
      @cart.qty += params[:qty].to_i

      respond_to do |format|
      if @cart.save


        format.html { redirect_back fallback_location: root_path,  notice: 'Product was successfully updated in cart.' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
    end

  end

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    #binding.pry
    @product = Product.find_by_id(params[:id])

    #@product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    # params.fetch(:product, {})
    # added qty
    params.require(:product).permit(:title, :picurl, :template, :body, :price, :msrp, :startdate, :enddate, :draft, :active, :category_id, :qty, :length, :width, :height, :weight, :courier, :courierurl, photos_attributes: [:product_id, :uri, :done, :_destroy])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    # params.fetch(:cart, {})
    params.require(:cart).permit(:user_id, :product_id, :qty)
  end

end
