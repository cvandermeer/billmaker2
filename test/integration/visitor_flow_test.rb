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
    assert_selector '.learning_goal', text: @learning_goal.goal + ' ' + @learning_goal.learned
  end

  test 'should delete competence' do
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
    click_link 'X'
    visit url
    assert_no_selector 'competence'
  end

  def covert_pdf_to_page
    temp_pdf = Temfile.new('pdf')
    temp_pdf << page.source.force_encoding('UTF-8')
    reader = PDF::Reader.new(temp_pdf)
    pdf_text = reader.pages.map(&:text)
    page.driver.response.instance_variable_set('@body', pdf_text)
  end

  private

  def initialize_bill
    @bill = bills(:bill1)
    @learning_goal = learning_goals(:learning_goal1)
  end
end
