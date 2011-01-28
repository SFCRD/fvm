#!/usr/bin/env ruby -wKU

require "test/unit"

require "fvm/lists/remotes"

class TestFvmListsRemotes < Test::Unit::TestCase
  # setup
  def setup
    @file = File.expand_path( File.join( __FILE__, '..', '..', '..', 'fixtures/parsers/flex-4-downloads.html' ) )
    @list = Fvm::Lists::Remotes.new( "file://#{@file}" )
  end
  # builds provides an array of objects
  def test_builds_provides_an_array_of_objects
    assert_equal( 22, @list.builds.size )
  end
  # builds provides a list of build objects
  def test_builds_provides_a_list_of_build_objects
    @list.builds.each do |build|
      assert_instance_of( Fvm::Builds::Remote, build )
    end
  end
end