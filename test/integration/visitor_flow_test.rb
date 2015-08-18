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
    click_button 'Start'
    assert_selector '#name', text: @bill.name
    fill_in('bill_period', with: @bill.period)
    fill_in('bill_groupname', with: @bill.groupname)
    click_button 'Rekening updaten'
    assert_selector '#period', text: @bill.period
    assert_selector '#groupname', text: @bill.groupname
    select('Concepting', from: 'competence_title')
    select(6, from: 'competence_points')
    select('Gevorderd', from: 'competence_level')
    click_button 'Competentie toevoegen'
    assert_selector '.competence', text: 'Concepting 6 Gevorderd'
  end

  private

  def initialize_bill
    @bill = bills(:bill1)
  end
end
