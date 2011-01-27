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
end