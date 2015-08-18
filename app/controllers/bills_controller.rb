class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :update]

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Rekening-van-' + @bill.name
      end
    end
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    redirect_to @bill if @bill.save
  end

  def update
    render @bill, bill: @bill if @bill.update(bill_params)
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_params
    params.require(:bill).permit(:name, :period, :groupname)
  end
end
