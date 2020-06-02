class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  include Pagy::Backend
  before_action :authenticate_user!
  # GET /transactions
  # GET /transactions.json
  def index
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Transactions'

    if User.where('admin =?', current_user.admin )
      @transactions.all.order('created_at DESC')
    else

      @transactions = Transaction.where('user_id =?', current_user.id).order('created_at DESC')
    end

    #@feedback_recieved = Feedback.exists?(@transaction)
    @pagy, @transactions = pagy(@transactions)
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Transaction'
  end

  # GET /transactions/new
  def new
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'New Transaction'
    @transaction = Transaction.new

  end

  # GET /transactions/1/edit
  def edit
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Edit Transactions'
  end

  # POST /transactions
  # POST /transactions.json
  def create
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'New Transaction'

    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Edit Transaction'

    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:transaction_id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:transaction_msg, :user_id, :shipped, :invoice_number, :tracking_number, :postal_carrier)
    end
end
