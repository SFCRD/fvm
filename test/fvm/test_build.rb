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
  # responds to spaceship
  def test_responds_to_spaceship
    assert_respond_to( Fvm::CLI::Build.new, :'<=>' )
  end
  # sorts correctly
  def test_sorts_correctly
    one   = Fvm::CLI::Build.new( :version => '10.2.30' )
    two   = Fvm::CLI::Build.new( :version => '1.20.13' )
    three = Fvm::CLI::Build.new( :version => '5.6.7' )
    assert_equal( [ two, three, one ], [ one, two, three ].sort )
  end
end