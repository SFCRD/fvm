require "test/unit"

require "fvm/cli/installation"

class TestFvmCliInstallation < Test::Unit::TestCase
  # setup
  def setup
    @installation = Fvm::CLI::Installation.new( 'parent/dirs/flex_sdk_1.2.3.4567' )
  end
  # dir returns expanded directory passed to constructor
  def test_dir_returns_expanded_directory_passed_to_constructor
    assert_equal( File.expand_path( 'parent/dirs/flex_sdk_1.2.3.4567' ), @installation.dir.to_s )
  end
  # version returns the version at the end of the dirname
  def test_version_returns_the_version_at_the_end_of_the_dirname
    assert_equal( '1.2.3.4567', @installation.version )
  end
  # responds to active?
  def test_responds_to_active?
    assert_respond_to( Fvm::CLI::Installation.new( '.' ), :active? )
  end
  # responds to to_menu
  def test_responds_to_to_menu
    assert_respond_to( Fvm::CLI::Installation.new( '.' ), :to_menu )
  end
  # responds to spaceship
  def test_responds_to_spaceship
    assert_respond_to( Fvm::CLI::Build.new, :'<=>' )
  end
  # sorts correctly
  def test_sorts_correctly
    one   = Fvm::CLI::Installation.new( 'dir/flex_sdk_3.0.0.346' )
    two   = Fvm::CLI::Installation.new( 'dir/flex_sdk_1.10.3.9999' )
    three = Fvm::CLI::Installation.new( 'dir/flex_sdk_1.2.3.4567' )
    assert_equal( [ three, two, one ], [ one, two, three ].sort )
  end
end