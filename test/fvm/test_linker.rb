require "test/unit"

require "fvm/cli/linker"

class TestFvmCliLinker < Test::Unit::TestCase
  # setup
  def setup
    @dir = Pathname.new( File.dirname( __FILE__ ) ).join( '../fixtures/linker' )
    @linker = Fvm::CLI::Linker.new( @dir.to_s, [ 'executable' ] )
  end
  # teardown
  def teardown
    Dir[ File.join( @linker.dir, '*' ) ].reject { |f| File.directory? f }.each { |f| File.delete f }
  end
  # finds correct list of files in the given directory
  def test_finds_correct_list_of_files_in_the_given_directory
    assert_equal( [ @dir.join( 'bin', 'executable' ).to_s ], @linker.files( @dir.join( 'bin' ) ) )
  end
  # creates symlinks for files found in the given directory
  def test_creates_symlinks_for_files_found_in_the_given_directory
    assert_equal( false, @dir.join( 'executable' ).exist? )
    @linker.link( @dir.join( 'bin' ) )
    assert_equal( true, @dir.join( 'executable' ).exist? )
  end
  # can unlink all symlinks it has created
  def test_can_unlink_all_symlinks_it_has_created
    assert_equal( false, @dir.join( 'executable' ).exist? )
    @linker.link( @dir.join( 'bin' ) )
    assert_equal( true, @dir.join( 'executable' ).exist? )
    @linker.unlink!
    assert_equal( false, @dir.join( 'executable' ).exist? )
  end
end