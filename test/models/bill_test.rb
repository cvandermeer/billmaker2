require 'test_helper'

class BillTest < ActiveSupport::TestCase
  test 'should not create bill without any input' do
    bill = Bill.new
    assert_not bill.save, 'Saved a bill without input!'
  end
end