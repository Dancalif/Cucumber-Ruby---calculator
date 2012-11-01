require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

# Declare Global Variables. The values will be assigned later.

$new_varA = ()
$new_varB = ()
$new_varC = ()

describe "HW30RSPEC" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://www.mortgagecalculator.org/"
    @driver.manage.timeouts.implicit_wait = 10
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end

# Input: Home Value - 800,000, Credit Profile - Good, Loan Amount - 600,00, Loan # Purpose - New Purchase, Ineterst Rate - 3%,
# Loan Term - 30 years, Start Date - Sep 2012, Property Tax - 0%, PMI - 0%.
  
 it "test_hw30_rspec1" do
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

# Taking screenshot to make sure that the values are correct.

@driver.save_screenshot('before_click1.png')
    @driver.find_element(:css, "input[type=\"submit\"]").click

# Verify Monthly Payment. Should be $2,529.62

(@driver.find_element(:xpath, "//table[@id='summary']/tbody/tr[3]/td[1]/h3").text).should == "$2,529.62"

# Assign the value (Mothlly Payment) to ar - $new_varA

$new_varA = @driver.find_element(:xpath, "//table[@id='summary']/tbody/tr[3]/td[1]/h3").text
$new_varA = $new_varA.delete(',').slice!(1..-1).to_f
puts "If Interest Rate is 3% then Monthly Payment is \t $#{$new_varA}"

puts $new_varA.class

# Taking screenshot to make sure that the all values including Monthly Payment displayed properly.

@driver.save_screenshot('after_click1.png')
  end


# Input: Home Value - 800,000, Credit Profile - Good, Loan Amount - 600,00, Loan Purpose - New Purchase, Ineterst Rate - 4%,
# Loan Term - 30 years, Start Date - Sep 2012, Property Tax - 0%, PMI - 0%.

  it "test_hw30_rspec2" do
    @driver.get(@base_url + "/")
    @driver.find_element(:name, "param[homevalue]").clear
    @driver.find_element(:name, "param[homevalue]").send_keys "800,000"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "param[credit]")).select_by(:text, "Good")
    @driver.find_element(:name, "param[principal]").clear
    @driver.find_element(:name, "param[principal]").send_keys "600,000"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "param[rp]")).select_by(:text, "New Purchase")
    @driver.find_element(:name, "param[interest_rate]").clear
    @driver.find_element(:name, "param[interest_rate]").send_keys "4"
    @driver.find_element(:name, "param[term]").clear
    @driver.find_element(:name, "param[term]").send_keys "30"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "param[start_month]")).select_by(:text, "Sep")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "param[start_year]")).select_by(:text, "2012")
    @driver.find_element(:name, "param[property_tax]").clear
    @driver.find_element(:name, "param[property_tax]").send_keys "0"
    @driver.find_element(:name, "param[pmi]").clear
    @driver.find_element(:name, "param[pmi]").send_keys "0"

# Taking screenshot to make sure that the values are correct

@driver.save_screenshot('before_click2.png')
    @driver.find_element(:css, "input[type=\"submit\"]").click

# Verify Monthly Payment. Should be $2,864.49

(@driver.find_element(:xpath, "//table[@id='summary']/tbody/tr[3]/td[1]/h3").text).should == "$2,864.49"

# Assign the value (Mothlly Payment) to ar - $new_varB

$new_varB = @driver.find_element(:xpath, "//table[@id='summary']/tbody/tr[3]/td[1]/h3").text
$new_varB = $new_varB.delete(',').slice!(1..-1).to_f
puts "If Interest Rate is 4% then Monthly Payment is \t $#{$new_varB}"

puts $new_varB.class


# Taking screenshot to make sure that the all values including Monthly Payment displayed properly.

@driver.save_screenshot('after_click.png')

$new_varC = 100 - ($new_varA/$new_varB*100)
puts "Percentage increase (3% vs. 4%) is \t #{$new_varC}%"

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
