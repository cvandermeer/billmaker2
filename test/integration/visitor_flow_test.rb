require 'test_helper'

class VisitorFlowTest < ActionDispatch::IntegrationTest
  setup :initialize_bill

  def teardown
    @bill = nil
  end

  private

  def initialize_bill
    @bill = bills(:one)
  end
end