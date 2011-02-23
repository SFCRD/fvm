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
end