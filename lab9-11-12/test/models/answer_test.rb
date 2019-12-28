# test/models/answer_test.rb
require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test 'палиндром на входе' do
    assert_equal [[11, true]], Answer.where(query: 11).first_or_create.get_solution
  end

  test 'результаты вычислений различны при различных входных параметрах' do
    assert_not_equal Answer.where(query: 5).first_or_create.get_solution,
                     Answer.where(query: 6).first_or_create.get_solution
  end

  test 'Отрицательное число на входе' do
    assert_equal [], Answer.where(query: -31_415).first_or_create.get_solution
  end

  test 'нормальные данные 1 на входе' do
    assert_equal [[1345, false], [6776, true]], Answer.where(query: 1345).first_or_create.get_solution
  end

  test 'добавления данных 2 раза' do
    (Answer.find_by query: 9).destroy unless (Answer.find_by query: 9).nil?
    Answer.create query: 9, solution: ActiveSupport::JSON.encode([9, true])
    Answer.create query: 9, solution: ActiveSupport::JSON.encode([9, true])
    (Answer.find_by query: 9).destroy
    assert_nil Answer.find_by query: 9
  end

  test 'добавление данных в базу' do
    (Answer.find_by query: 9).destroy unless (Answer.find_by query: 9).nil?
    Answer.create query: 9, solution: ActiveSupport::JSON.encode([9, true])
    assert_not_nil Answer.find_by query: 9
  end
end
