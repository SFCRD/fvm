#!/usr/bin/env ruby -wKU

require "test/unit"

require "fvm/installers/wget"

class TestFvmInstallersWget < Test::Unit::TestCase
  # setup
  def setup
    @data = 'https://github.com/SFCRD/fvm/blob/master/test/fixtures/installers/data/flex_sdk_4.1.0.12345.zip'
    @dest = File.expand_path( File.join( __FILE__, '..', '..', '..', 'fixtures/installers' ) )
    @expected = File.join( @dest, File.basename( @data ) )
    @installer = Fvm::Installers::Wget.new
  end
  # teardown
  def teardown
    File.delete( @expected ) if File.exist?( @expected )
  end
  # fixture destination file does not exist
  def test_fixture_destination_file_does_not_exist
    assert_equal( false, File.exist?( @expected ) )
  end
  # install grabs a remote file and downloads it to path
  def test_install_grabs_a_remote_file_and_downloads_it_to_path
    @installer.install!( @data, @dest )
    assert( File.exist?( @expected ), "Failed to download file." )
  end
end