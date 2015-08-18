require 'test_helper'

class BillsControllerTest < ActionController::TestCase
  setup :initialize_bill

  def teardown
    @bill = nil
  end

  test 'should show bill' do
    get :show, id: @bill
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create bill' do
    assert_difference('Bill.count') do
      post :create, bill: { name: @bill.name }
    end
    assert_redirected_to bill_path(assigns(:bill))
  end

  test 'should update bill' do
    patch :update, id: @bill.id, bill: { period: @bill.period, groupname: @bill.groupname }
    assert_redirected_to bill_path(assigns(:bill))
  end

  private

  def initialize_bill
    @bill = bills(:bill1)
  end
end
