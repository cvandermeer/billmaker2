require 'test_helper'

class BillFlowTest < ActionDispatch::IntegrationTest
  test 'should see the welcome page' do
    get '/'
    assert_select 'h1', 'Hoe maak je nou een rekening?'
  end
end
