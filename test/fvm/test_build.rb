require "test/unit"

require "fvm/cli/build"

class TestFvmBuild < Test::Unit::TestCase
  # download url is correct for a numeric sdk
  def test_download_url_is_correct_for_a_numeric_sdk
    build = Fvm::CLI::Build.new( :version => '1.2.3.4567', :sdk => 4 )
    assert_equal( "http://fpdownload.adobe.com/pub/flex/sdk/builds/flex4/flex_sdk_1.2.3.4567_mpl.zip", build.zip_url )
  end
  # download url is correct for a word sdk
  def test_download_url_is_correct_for_a_word_sdk
    build = Fvm::CLI::Build.new( :version => '1.2.3.4567', :sdk => 'Hero' )
    assert_equal( "http://fpdownload.adobe.com/pub/flex/sdk/builds/flexhero/flex_sdk_1.2.3.4567_mpl.zip", build.zip_url )
  end
  # responds to active?
  def test_responds_to_active?
    assert_respond_to( Fvm::CLI::Build.new, :active? )
  end
  # responds to to_menu
  def test_responds_to_to_menu
    assert_respond_to( Fvm::CLI::Build.new, :to_menu )
  end
  
end