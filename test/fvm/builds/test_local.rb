#!/usr/bin/env ruby -wKU

require "test/unit"

require "fvm/builds/local"

class TestFvmBuildsLocal < Test::Unit::TestCase
  # setup
  def setup
    @file = File.expand_path( File.join( __FILE__, '..', '..', '..', 'fixtures/builds/flex_sdk_4.1.0.16032' ) )
  end
  # fixture file exists
  def test_fixture_file_exists
    assert( File.exist?( @file ), "Could not find test fixture directory" )
  end
  # accepts a filename in constructor
  def test_accepts_a_filename_in_constructor
    build = Fvm::Builds::Local.new( @file )
    assert_equal( @file, build.filename )
  end
  # parses version number of folder for version
  def test_parses_version_number_of_folder_for_version
    build = Fvm::Builds::Local.new( @file )
    assert_equal( '4.1.0.16032', build.version )
  end
  # uses file created time for date
  def test_uses_file_created_time_for_date
    build = Fvm::Builds::Local.new( @file )
    assert_equal( File.ctime( @file ), build.date )
  end
  # bins returns correct amount of executables in bin directory
  def test_bins_returns_correct_amount_of_executables_in_bin_directory
    build = Fvm::Builds::Local.new( @file )
    assert_equal( 2, build.bins.size )
  end
  # bins returns a list of structs that have a name and a path
  def test_bins_returns_a_list_of_structs_that_have_a_name_and_a_path
    build = Fvm::Builds::Local.new( @file )
    build.bins.each do |bin|
      assert_respond_to( bin, :name )
      assert_respond_to( bin, :path )
    end
  end
  # bins returns correctly named bins
  def test_bins_returns_correctly_named_bins
    build = Fvm::Builds::Local.new( @file )
    assert_equal( [ 'anothersample', 'sampleprogram' ], build.bins.map( &:name ) )
  end
  # bins returns all unix executables in the bin directory
  def test_bins_returns_all_unix_executables_in_the_bin_directory
    build = Fvm::Builds::Local.new( @file )
    expected = [ 'anothersample', 'sampleprogram' ].map { |f| File.join( @file, 'bin', f ) }
    assert_equal( expected, build.bins.map( &:path ) )
  end
end