class TicketnotesController < ApplicationController
  include Pagy::Backend

  before_action :set_ticketnotes, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /ticketnotes
  # GET /ticketnotes.json
  def index
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Ticket notes'

    #@ticketnotes  = Ticketnotes.where('user_id =?', current_user.id).order('created_at DESC')
    @ticketnotes  = Ticketnote.all
    @pagy, @ticketnotes = pagy(@ticketnotes)

  end

  # GET /ticketnotes/1
  # GET /ticketnotes/1.json
  def show
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Ticket notes'
  end

  # GET /ticketnotes/new
  def new
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'New Ticket notes'

    @ticketnote = Ticketnote.new
  end

  # GET /ticketnotes/1/edit
  def edit
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Edit Ticket notes'
  end

  # POST /ticketnotes
  # POST /ticketnotes.json
  def create
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'New Ticket notes'

    @ticketnote = Ticketnote.new(ticketnote_params)

    respond_to do |format|
      if @ticketnote.save
        format.html { redirect_to @ticketnote , notice: 'Ticket note was successfully created.' }
        format.json { render :show, status: :created, location: @ticketnote }
      else
        format.html { render :new }
        format.json { render json: @ticketnote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticketnotes/1
  # PATCH/PUT /ticketnotes/1.json
  def update
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Edit Ticketnotes'

    respond_to do |format|
      if @ticketnote.update(ticketnote_params)
        format.html { redirect_to @ticketnote, notice: 'Ticket note was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticketnote }
      else
        format.html { render :edit }
        format.json { render json: @ticketnote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticketnotes/1
  # DELETE /ticketnotes/1.json
  def destroy
    @ticketnote.destroy
    respond_to do |format|
      format.html { redirect_to ticketnotes_url, notice: 'Ticket note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticketnotes
      @ticketnote = Ticketnote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticketnote_params
      params.require(:ticketnote).permit(:notes , :troubleticket_id )

    end
end
