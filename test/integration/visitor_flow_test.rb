require 'test_helper'

class VisitorFlowTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  setup :initialize_bill

  def teardown
    @bill = nil
  end

  test 'should create and update bill' do
    visit('/')
    fill_in('bill_name', with: @bill.name)
    click_button 'Create Bill'
    page.has_selector?('#name')
    fill_in('bill_period', with: @bill.period)
    fill_in('bill_groupname', with: @bill.groupname)
    click_button 'Update Bill'
    page.has_selector?('#period')
    page.has_selector?('#groupname')
  end

  private

  def initialize_bill
    @bill = bills(:bill1)
  end
end
