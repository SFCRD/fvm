require "test/unit"

require "fvm/driver"

class TestFvmDriver < Test::Unit::TestCase
  def test_case_name
    @driver = Fvm::Driver.new
    
    @driver.install
  end
end