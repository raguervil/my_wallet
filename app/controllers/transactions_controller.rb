class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_transaction, only: %i[show edit update]

  def index
    @pagy, @transactions = pagy(Transaction.all)
  end

  def show; end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = current_user.transactions.new transaction_params
    if @transaction.save
      return redirect_to root_url, notice: t('.notice')
    end

    render :new
  end

  def edit; end

  def update
    if @transaction.update transaction_params
      return redirect_to @transaction, notice: t('.notice')
    end

    render :edit
  end

  private

  def transaction_params
    params.require(:transaction).permit(:date, :transaction_type, :amount, :category, :description)
  end

  def set_transaction 
    @transaction = Transaction.find params[:id]
  end

end
