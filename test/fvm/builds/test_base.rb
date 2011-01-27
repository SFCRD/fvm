#!/usr/bin/env ruby -wKU

require "test/unit"

require "fvm/builds/base"

class TestFvmBuildsBase < Test::Unit::TestCase
  # accepts version in constructor
  def test_accepts_version_in_constructor
    build = Fvm::Builds::Base.new( 'version string', 'date string' )
    assert_equal( 'version string', build.version )
  end
  # accepts date in constructor
  def test_accepts_date_in_constructor
    build = Fvm::Builds::Base.new( 'version string', 'date string' )
    assert_equal( 'date string', build.date )
  end
end