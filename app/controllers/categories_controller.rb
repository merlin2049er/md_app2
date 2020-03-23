class CategoriesController < ApplicationController
  include Pagy::Backend

  before_action :set_category, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /categories
  # GET /categories.json
  def index
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'categories', :categories_path

    @categories = Category.all
    # @pagy, @categories = Category.order(:name).pagy(page: params[:page] , per_page: 10)
    @pagy, @categories = pagy(Category.order(:name))
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    # added 9/24

    @category = Category.find(params[:id])

    require 'time'

    todaydate = Time.new
    #    set 'todaydate' equal to the current date/time.

    todaydate = todaydate.year.to_s + '-' + todaydate.month.to_s + '-' + todaydate.day.to_s

    @title = @category.name
    @pagy, @products = pagy(@category.products.where('draft' => false, 'active' => true, 'funded' => false).where('enddate > ?', todaydate))

    # @products = @category.products.where( 'enddate > ?', todaydate )

    # add_breadcrumb 'category / ' << @title, categories_path  # frozen string - had to remove it?

  end

  # GET /categories/new
  def new
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'category', :categories_path
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    add_breadcrumb 'category', :categories_path
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name, :picurl)
  end

end