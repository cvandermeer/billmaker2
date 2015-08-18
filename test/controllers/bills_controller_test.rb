require 'test_helper'

class BillsControllerTest < ActionController::TestCase
  setup :set_bill

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should be able to create bill' do
    assert_difference('Bill.count') do
      post :create, bill: {name: @bill.name, period: @bill.period, groupname: @bill.groupname}
    end
  end

  private

  def set_bill
    @bill = bills(:bill1)
  end
end
