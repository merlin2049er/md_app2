class FaqsController < ApplicationController
  before_action :set_faq, only: [:show, :edit, :update, :destroy]
  include Pagy::Backend

  # GET /faqs
  # GET /faqs.json
  def index
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'FAQ'
    @faqs = Faq.all

     @pagy, @faqs = pagy(Faq.all.order(:created_at))


  end

  # GET /faqs/1
  # GET /faqs/1.json
  def show
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'FAQ'
  end

  # GET /faqs/new
  def new
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'New FAQ'
    @faq = Faq.new
  end

  # GET /faqs/1/edit
  def edit
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Edit FAQ'
  end

  # POST /faqs
  # POST /faqs.json
  def create
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'New FAQ'

    @faq = Faq.new(faq_params)

    respond_to do |format|
      if @faq.save
        format.html { redirect_to @faq, notice: 'Faq was successfully created.' }
        format.json { render :show, status: :created, location: @faq }
      else
        format.html { render :new }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faqs/1
  # PATCH/PUT /faqs/1.json
  def update
    respond_to do |format|
      if @faq.update(faq_params)
        format.html { redirect_to @faq, notice: 'Faq was successfully updated.' }
        format.json { render :show, status: :ok, location: @faq }
      else
        format.html { render :edit }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faqs/1
  # DELETE /faqs/1.json
  def destroy
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to faqs_url, notice: 'Faq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faq
      @faq = Faq.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def faq_params
      params.require(:faq).permit(:question, :answer)
    end
end
