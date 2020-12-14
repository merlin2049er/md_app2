# frozen_string_literal: true

class FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[show edit update destroy]
  include Pagy::Backend
  before_action :authenticate_user!

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    #add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Feedback'

    @feedbacks = Feedback.all
    @feedbacks = Feedback.count

    @pagy, @feedbacks = pagy(Feedback.all.order(:created_at))
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
    #add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Feedback'
  end

  # GET /feedbacks/new
  def new
    #add_breadcrumb @site_name, :root_path
    add_breadcrumb 'New Feedback'

    #  puts "ssssssssssssssssssssss", params[:transaction_id].inspect
    @feedback = Feedback.new(transaction_id: params[:transaction_id])
    @transaction = Transaction.find_by_id(params[:transaction_id])

    if @transaction.feedback.blank?
      flash.now[:notice] = 'Please leave feedback...'
    else
      flash.now[:notice] = 'Thanks for your feedback...'
      redirect_to transactions_url
    end
  end

  # GET /feedbacks/1/edit
  def edit
    #add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Edit Feedback'
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    #add_breadcrumb @site_name, :root_path
    add_breadcrumb 'New Feedback'

    @feedback = Feedback.new(feedback_params)
    @feedback.transaction_id = params[:transaction_id]

    if @feedback.save
      flash.now[:notice] = 'Thanks for your feedback...'
      redirect_to transactions_url
    else
      puts 'errors', @feedback.errors.messages.inspect
      render :new
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    #add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Edit Feedback'

    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html do
          redirect_to @feedback, notice: 'Feedback was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json do
          render json: @feedback.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html do
        redirect_to feedbacks_url,
                    notice: 'Feedback was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def feedback_params
    params.require(:feedback).permit(
      :rate,
      :recommend,
      :comment,
      :transaction_id
    )
  end
end
