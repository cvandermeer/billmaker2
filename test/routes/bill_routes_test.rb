require 'test_helper'

class BillRoutesTest < ActionController::TestCase
  test 'should route to new bill' do
    assert_routing '/', { controller: 'bills', action: 'new' }
  end

  test 'should route to bill' do
    assert_routing 'bills/1', { controller: 'bills', action: 'show', id: '1' }
  end

  test 'should route to create bill' do
    assert_routing({ method: 'post', path: '/bills' }, { controller: 'bills', action: 'create' })
  end

  test 'should route to update bill' do
    assert_routing({ method: 'patch', path: '/bills/1'}, {controller: 'bills', action: 'update', id: '1'})
  end
end
