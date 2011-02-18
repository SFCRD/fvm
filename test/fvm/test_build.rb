require "test/unit"

require "fvm/build"

class TestFvmBuild < Test::Unit::TestCase
  # download url is correct for a numeric sdk
  def test_download_url_is_correct_for_a_numeric_sdk
    build = Build.new( :version => '1.2.3.4567', :sdk => 4 )
    assert_equal( "http://fpdownload.adobe.com/pub/flex/sdk/builds/flex4/flex_sdk_1.2.3.4567_mpl.zip", build.zip_url )
  end
  # download url is correct for a word sdk
  def test_download_url_is_correct_for_a_word_sdk
    build = Build.new( :version => '1.2.3.4567', :sdk => 'Hero' )
    assert_equal( "http://fpdownload.adobe.com/pub/flex/sdk/builds/flexhero/flex_sdk_1.2.3.4567_mpl.zip", build.zip_url )
  end
end