require 'json'
require 'selenium-webdriver'
require 'rspec'
include RSpec::Expectations

describe 'Test3' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = 'https://www.katalon.com/'
    puts @driver
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end

  it 'test_3' do
    @driver.get 'http://127.0.0.1:3000/login'
    @driver.find_element(:id, 'username').click
    @driver.find_element(:id, 'username').clear
    @driver.find_element(:id, 'username').send_keys '2222'
    @driver.find_element(:id, 'password').click
    @driver.find_element(:id, 'password').clear
    @driver.find_element(:id, 'password').send_keys '2222'
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:name, 'value').click
    @driver.find_element(:name, 'value').clear
    @driver.find_element(:name, 'value').send_keys '96'
    @driver.find_element(:xpath, "//input[@value='Найти палиндром']").click
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def alert_present?
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end

  def verify
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end

  def close_alert_and_get_its_text(_how, _what)
    alert = @driver.switch_to.alert()
    alert_text = alert.text
    if @accept_next_alert
      alert.accept
    else
      alert.dismiss
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
