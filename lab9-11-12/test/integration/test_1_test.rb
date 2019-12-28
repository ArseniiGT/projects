require 'test_helper'

class Test1Test < ActionDispatch::IntegrationTest
  test 'Перенаправление на страницу аутентификации' do
    get palindrome_input_url
    assert_response 302
    follow_redirect!
    assert_select 'h1', 'Вход'
  end

  test 'registration,signin and calc' do
    post '/users', params: { user: { name: '111', email: '111', password: '111', password_confirmation: '111' } }
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', 'Палиндром'
  end
end
