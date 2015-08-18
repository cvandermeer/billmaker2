require 'test_helper'

class BillTest < ActiveSupport::TestCase
  setup :initialize_bill

  def teardown
    @bill1 = nil
    @bill2 = nil
  end

  test 'should not create bill without name' do
    bill = Bill.new
    assert_not bill.save, 'Saved a bill without name!'
  end

  test 'should not update bill without groupname' do
    @bill2.period = @bill1.period
    assert_not @bill2.save, 'Saved a bill without groupname!'
  end

  test 'should not update bill without period' do
    @bill2.groupname = @bill1.groupname
    assert_not @bill2.save, 'Saved a bill without period!'
  end

  private

  def initialize_bill
    @bill1 = bills(:one)
    @bill2 = bills(:two)
  end
end
