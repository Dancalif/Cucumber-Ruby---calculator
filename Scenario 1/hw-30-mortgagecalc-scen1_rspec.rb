require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "HW30RSPEC" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://www.mortgagecalculator.org/"
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_hw30_rspec" do
    @driver.get(@base_url + "/")
    @driver.find_element(:name, "param[homevalue]").clear
    @driver.find_element(:name, "param[homevalue]").send_keys "800,000"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "param[credit]")).select_by(:text, "Good")
    @driver.find_element(:name, "param[principal]").clear
    @driver.find_element(:name, "param[principal]").send_keys "600,000"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "param[rp]")).select_by(:text, "New Purchase")
    @driver.find_element(:name, "param[interest_rate]").clear
    @driver.find_element(:name, "param[interest_rate]").send_keys "3"
    @driver.find_element(:name, "param[term]").clear
    @driver.find_element(:name, "param[term]").send_keys "30"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "param[start_month]")).select_by(:text, "Sep")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "param[start_year]")).select_by(:text, "2012")
    @driver.find_element(:name, "param[property_tax]").clear
    @driver.find_element(:name, "param[property_tax]").send_keys "0"
    @driver.find_element(:name, "param[pmi]").clear
    @driver.find_element(:name, "param[pmi]").send_keys "0"
@driver.save_screenshot('before_click.png')
    @driver.find_element(:css, "input[type=\"submit\"]").click
(@driver.find_element(:xpath, "//table[@id='summary']/tbody/tr[3]/td[1]/h3").text).should == "$2,529.62"
@driver.save_screenshot('after_click.png')
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
end
