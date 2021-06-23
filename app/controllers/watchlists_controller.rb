# frozen_string_literal: true

class WatchlistsController < ApplicationController
  before_action :set_watchlist, only: %i[destroy]
  include Pagy::Backend
  before_action :authenticate_user!

  # GET /watchlist
  # GET /watchlist.json
  def index
    add_breadcrumb 'Watch list'
    @watchlists =  Watchlist.where('user_id =?', current_user.id).order('created_at DESC')
    @pagy, @watchlists = pagy(@watchlists)
  end

  # GET /watchlists/new
  def new
    # add_breadcrumb 'New Watch list'
      @watchlist = Watchlist.new
  end

  def create
    #    add_breadcrumb 'New Todo list'
    @watchlist = Watchlist.new(watchlist_params)

    respond_to do |format|
      if @watchlist.save
        format.html do
          redirect_to @watchlist, notice: 'Product added to watch list.'
        end
        format.json { render :show, status: :created, location: @watchlist }
      else
        format.html { render :new , status: :unprocessable_entity }
        format.json do
          render json: @watchlist.errors, status: :unprocessable_entity
        end
      end
    end
  end


  # DELETE /watchlists/1
  # DELETE /watchlists/1.json
  def destroy
    @watchlist.destroy
    respond_to do |format|
      format.html do
        redirect_to watchlists_url,
                    notice: 'Watch item was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_watchlist
    @watchlist = Watchlist.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def watchlist_params
    params.require(:watchlist).permit(
      :user_id,
      :product_id
    )
  end
end
