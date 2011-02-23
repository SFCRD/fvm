require "test/unit"

require "fvm/cli/linker"

class TestFvmCliLinker < Test::Unit::TestCase
  # setup
  def setup
    @linker = Fvm::CLI::Linker.new( 'test/fixtures/linker', [ 'executable' ] )
  end
  # teardown
  def teardown
    Dir[ File.join( @linker.dir, '*' ) ].reject { |f| File.directory? f }.each { |f| File.delete f }
  end
  # finds correct list of files in the given directory
  def test_finds_correct_list_of_files_in_the_given_directory
    assert_equal( [ 'test/fixtures/linker/bin/executable' ], @linker.files( 'test/fixtures/linker/bin' ) )
  end
  # creates symlinks for files found in the given directory
  def test_creates_symlinks_for_files_found_in_the_given_directory
    assert_equal( false, File.exist?( 'test/fixtures/linker/executable' ) )
    @linker.link( 'test/fixtures/linker/bin' )
    assert_equal( true, File.exist?( 'test/fixtures/linker/executable' ) )
  end
  # can unlink all symlinks it has created
  def test_can_unlink_all_symlinks_it_has_created
    assert_equal( false, File.exist?( 'test/fixtures/linker/executable' ) )
    @linker.link( 'test/fixtures/linker/bin' )
    assert_equal( true, File.exist?( 'test/fixtures/linker/executable' ) )
    @linker.unlink!
    assert_equal( false, File.exist?( 'test/fixtures/linker/executable' ) )
  end
end