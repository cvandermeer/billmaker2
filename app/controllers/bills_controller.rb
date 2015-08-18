class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :update]

  def show
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    if @bill.save
      redirect_to @bill
    end
  end

  def update
    if @bill.update(bill_params)
      redirect_to @bill
    end
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_params
    params.require(:bill).permit(:name, :period, :groupname)
  end
end