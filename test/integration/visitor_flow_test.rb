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
    url = URI.parse(current_url)
    click_button 'Rekening updaten'
    visit url
    assert_selector '#period', text: @bill.period
    assert_selector '#groupname', text: @bill.groupname
    select('Concepting', from: 'competence_title')
    select(6, from: 'competence_points')
    select('Gevorderd', from: 'competence_level')
    click_button 'Competentie toevoegen'
    visit url
    assert_selector '.competence_info', text: 'Concepting 6 Gevorderd'
    fill_in('learning_goal_goal', with: @learning_goal.goal)
    fill_in('learning_goal_learned', with: @learning_goal.learned)
    click_button 'Leerdoel toevoegen'
    visit url
    assert_selector '.learning_goal', text: 'Ik wil leren hoe ik de apa normering toe kan passen Ik heb dit geleerd door het te proberen op de bronnenlijst van het projectrapport'
  end

  private

  def initialize_bill
    @bill = bills(:bill1)
    @learning_goal = learning_goals(:learning_goal1)
  end
end
