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
    @linker.link( 'symlinkertest', File.join( @path, 'linkertest' ) )
    assert_equal( true, File.exist?( File.join( @path, 'symlinkertest' ) ) )
  end
  # returns path to newly created symlink
  def test_returns_path_to_newly_created_symlink
    path = @linker.link( 'symlinkertest', File.join( @path, 'linkertest' ) )
    assert_equal( File.join( @path, 'symlinkertest' ), path )
  end
  # can link absolute path to executable
  def test_can_link_absolute_path_to_executable
    @linker.link( 'symlinkertest', File.join( @path, 'linkertest' ) )
    assert_equal( 'Linker works yo!', `#{File.join( @path, 'symlinkertest' )}`.chomp )
  end
  # can unlink a created symlink in path
  def test_can_unlink_a_created_symlink_in_path
    path = @linker.link( 'symlinkertest', File.join( @path, 'linkertest' ) )
    assert_equal( true, File.exist?( path ) )
    @linker.unlink( 'symlinkertest' )
    assert_equal( false, File.exist?( path ) )
  end
  # linked correctly identifies when a link is not created
  def test_linked_correctly_identifies_when_a_link_is_not_created
    assert_equal( false, @linker.linked?( 'symlinkertest' ) )
  end
  # linked correctly identifies when a link has been created
  def test_linked_correctly_identifies_when_a_link_has_been_created
    @linker.link( 'symlinkertest', File.join( @path, 'linkertest' ) )
    assert_equal( true, @linker.linked?( 'symlinkertest' ) )
  end
end