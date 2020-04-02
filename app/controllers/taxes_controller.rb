class TaxesController < ApplicationController
  before_action :set_tax, only: [:show, :edit, :update, :destroy]
  include Pagy::Backend
  before_action :authenticate_user!
  # GET /taxes
  # GET /taxes.json
  def index
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'Taxes'
    @taxes = Tax.all
    @taxes = Tax.count

   @pagy, @taxes = pagy(Tax.all.order(:prov_id))
  end

  # GET /taxes/1
  # GET /taxes/1.json
  def show
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'Taxes'
  end

  # GET /taxes/new
  def new
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'New Tax'
    @tax = Tax.new
  end

  # GET /taxes/1/edit
  def edit
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'Edit Tax'
  end

  # POST /taxes
  # POST /taxes.json
  def create
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'New Tax'

    @tax = Tax.new(tax_params)

    respond_to do |format|
      if @tax.save
        format.html { redirect_to @tax, notice: 'Tax was successfully created.' }
        format.json { render :show, status: :created, location: @tax }
      else
        format.html { render :new }
        format.json { render json: @tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taxes/1
  # PATCH/PUT /taxes/1.json
  def update
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'Edit Tax'

    respond_to do |format|
      if @tax.update(tax_params)
        format.html { redirect_to @tax, notice: 'Tax was successfully updated.' }
        format.json { render :show, status: :ok, location: @tax }
      else
        format.html { render :edit }
        format.json { render json: @tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxes/1
  # DELETE /taxes/1.json
  def destroy
    @tax.destroy
    respond_to do |format|
      format.html { redirect_to taxes_url, notice: 'Tax was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax
      @tax = Tax.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tax_params
      params.require(:tax).permit(:prov_id, :tax_rate, :enabled, :comment)
    end
end
