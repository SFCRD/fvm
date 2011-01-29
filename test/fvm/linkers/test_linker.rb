#!/usr/bin/env ruby -wKU

require "test/unit"

require "fvm/linkers/linker"

class TestFvmLinkersLinker < Test::Unit::TestCase
  # setup
  def setup
    @path = File.expand_path( File.join( __FILE__, '..', '..', '..', 'fixtures/linkers' ) )
    @linker = Fvm::Linkers::Linker.new( @path )
  end
  # teardown
  def teardown
    File.delete( File.join( @path, 'symlinkertest' ) ) if File.exist?( File.join( @path, 'symlinkertest' ) )
  end
  # fixture files exist
  def test_fixture_files_exist
    assert( File.exist?( @path ), "Fixture directory doesn't exist" )
    assert( File.exist?( File.join( @path, 'linkertest' ) ), "Fixture executable doesn't exist" )
    assert( File.executable?( File.join( @path, 'linkertest' ) ), "Fixture executable isn't executable" )
  end
  # can execute fixture executable
  def test_can_execute_fixture_executable
    assert_equal( 'Linker works yo!', `#{File.join( @path, 'linkertest' )}`.chomp )
  end
  # creates symlink in path
  def test_creates_symlink_in_path
    # @linker.link( 'symlinkertest', File.join( @path, 'linkertest' ) )
    
  end
  # can link absolute path to executable
  def test_can_link_absolute_path_to_executable
    @linker.link( 'symlinkertest', File.join( @path, 'linkertest' ) )
    assert_equal( 'Linker works yo!', `#{File.join( @path, 'symlinkertest' )}`.chomp )
  end
end