require 'test_helper'

class CompetenceTest < ActiveSupport::TestCase
  setup :initialize_competence

  def teardown
    @competence = nil
  end

  ### VALIDATIONS ###

  test 'should not create competence without any input' do
    competence = Competence.new
    assert_not competence.save, 'Saved a competence without any input!'
  end

  test 'should not create competence without title' do
    competence = Competence.new(points: @competence1.points,
                                level: @competence1.level,
                                bill: @competence1.bill)
    assert_not competence.save, 'Saved a competence without title!'
  end

  test 'should not create competence without points' do
    competence = Competence.new(title: @competence1.title,
                                level: @competence1.level,
                                bill_id: @competence1.bill_id)
    assert_not competence.save, 'Saved a competence without points!'
  end

  test 'should not create competence without level' do
    competence = Competence.new(title: @competence1.title,
                                points: @competence1.points,
                                bill_id: @competence1.bill_id)
    assert_not competence.save, 'Saved a competence without level!'
  end

  test 'should not create competence without bill_id' do
    competence = Competence.new(title: @competence1.title,
                                points: @competence1.points,
                                level: @competence1.level)
    assert_not competence.save, 'Saved a competence without bill_id!'
  end

  private

  def initialize_competence
    @competence1 = competences(:competence1)
  end
end
