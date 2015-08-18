class BillsController < ApplicationController
  before_action :set_bill, only: :show

  def show
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    redirect_to @bill if @bill.save
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_params
    params.require(:bill).permit(:name, :period, :groupname)
  end
end
