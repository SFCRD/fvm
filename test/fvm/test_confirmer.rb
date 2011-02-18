require "test/unit"

require "fvm/confirmer"

class TestFvmConfirmer < Test::Unit::TestCase
  # setup
  def setup
    @confirmer = Fvm::Confirmer.new
  end
  # has license
  def test_has_license
    assert_instance_of( String, @confirmer.license )
  end
  # has agreement
  def test_has_agreement
    assert_instance_of( String, @confirmer.agreement )
  end
  # has correct license url
  def test_has_correct_license_url
    assert_equal( "http:/www.mozilla.org/MPL/", @confirmer.license_url )
  end
end