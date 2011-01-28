#!/usr/bin/env ruby -wKU

require "test/unit"

require "fvm/builds/remote"

class TestFvmBuildsRemote < Test::Unit::TestCase
  # setup
  def setup
    @version = '4.1.0.16021'
    @time = 'Tue May 11, 2010'
  end
  # version string is accepted as is
  def test_version_string_is_accepted_as_is
    build = Fvm::Builds::Remote.new( @version, @time )
    assert_equal( @version, build.version )
  end
  # parses date string into time object for date
  def test_parses_date_string_into_time_object_for_date
    build = Fvm::Builds::Remote.new( @version, @time )
    assert_equal( Time.parse( @time ), build.date )
  end
  # provides download url based on version
  def test_provides_download_url_based_on_version
    build = Fvm::Builds::Remote.new( @version, @time )
    assert_equal( "http://fpdownload.adobe.com/pub/flex/sdk/builds/flex4/flex_sdk_4.1.0.16021_mpl.zip", build.url )
  end
end