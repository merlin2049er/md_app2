class TroubleticketsController < ApplicationController
  before_action :set_troubleticket, only: [:show, :edit, :update, :destroy]
  include Pagy::Backend
  before_action :authenticate_user!

  # GET /troubletickets
  # GET /troubletickets.json
  def index
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Trouble Ticket'



    if current_user.admin == true
      @troubletickets = Troubleticket.all
    else
      @troubletickets = Troubleticket.where('user_id =?', current_user.id).order('created_at DESC')
    end

    @pagy, @troubletickets = pagy(Troubleticket.all.order(:created_at))

  end

  # GET /troubletickets/1
  # GET /troubletickets/1.json
  def show
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Trouble Ticket'
  end

  # GET /troubletickets/new
  def new
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'New Trouble Ticket'

    @troubleticket = Troubleticket.new
  end

  # GET /troubletickets/1/edit
  def edit
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Edit Trouble Ticket'
  end

  # POST /troubletickets
  # POST /troubletickets.json
  def create
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'New Trouble Ticket'

    @troubleticket = Troubleticket.new(troubleticket_params)

    respond_to do |format|
      if @troubleticket.save
        format.html { redirect_to @troubleticket, notice: 'Trouble ticket was successfully created.' }
        format.json { render :show, status: :created, location: @troubleticket }
      else
        format.html { render :new }
        format.json { render json: @troubleticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /troubletickets/1
  # PATCH/PUT /troubletickets/1.json
  def update
    respond_to do |format|
      if @troubleticket.update(troubleticket_params)
        format.html { redirect_to @troubleticket, notice: 'Trouble ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @troubleticket }
      else
        format.html { render :edit }
        format.json { render json: @troubleticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /troubletickets/1
  # DELETE /troubletickets/1.json
  def destroy
    @troubleticket.destroy
    respond_to do |format|
      format.html { redirect_to troubletickets_url, notice: 'Trouble ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_troubleticket
      @troubleticket = Troubleticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def troubleticket_params
      params.require(:troubleticket).permit(:user_id, :status, :campaign, :subject, :message)
    end
end
