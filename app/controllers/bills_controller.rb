class BillsController < ApplicationController
  before_action :set_bill, only: :show

  def show
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    if @bill.save
      redirect_to @bill
    else
      render :new
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
