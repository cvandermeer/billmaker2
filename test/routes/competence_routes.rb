require 'test_helper'

class CompetenceRoutesTest < ActionController::TestCase
  test 'should route to create competence' do
    assert_routing({ method: 'post', path: '/competences' }, controller: 'competences', action: 'create')
  end
end
