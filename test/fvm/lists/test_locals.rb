#!/usr/bin/env ruby -wKU

require "test/unit"

require "fvm/lists/locals"

class TestFvmListsLocals < Test::Unit::TestCase
  # setup
  def setup
    @path = File.expand_path( File.join( __FILE__, '..', '..', '..', 'fixtures/lists' ) )
  end
  # fixture path exists
  def test_fixture_path_exists
    assert( File.exist?( @path ), "Fixture directory could not be found" )
  end
  # accepts directory to list in constructor
  def test_accepts_directory_to_list_in_constructor
    list = Fvm::Lists::Locals.new( @path )
    assert_equal( @path, list.path )
  end
  # builds provides an array of objects
  def test_builds_provides_an_array_of_objects
    list = Fvm::Lists::Locals.new( @path )
    assert_equal( 2, list.builds.size )
  end
  # builds provides a list of build objects
  def test_builds_provides_a_list_of_build_objects
    list = Fvm::Lists::Locals.new( @path )
    list.builds.each do |build|
      assert_instance_of( Fvm::Builds::Local, build )
    end
  end
  # installed correctly identifies installed sdk build
  def test_installed_correctly_identifies_installed_sdk_build
    list = Fvm::Lists::Locals.new( @path )
    assert_equal( true, list.installed?( '3.2.0.3958' ) )
    assert_equal( true, list.installed?( '4.1.0.16032' ) )
    assert_equal( false, list.installed?( '3.2.1.9999' ) )
  end
end