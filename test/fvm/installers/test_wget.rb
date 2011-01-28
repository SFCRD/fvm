#!/usr/bin/env ruby -wKU

require "test/unit"

require "fvm/installers/wget"

require 'fileutils'

class TestFvmInstallersWget < Test::Unit::TestCase
  # setup
  def setup
    @file      = 'https://github.com/SFCRD/fvm/raw/master/test/fixtures/files/flex_sdk_4-1.1.0.12345_mpl.zip'
    @dest      = File.expand_path( File.join( __FILE__, '..', '..', '..', 'fixtures/installers' ) )
    @download  = File.join( @dest, File.basename( @file ) )
    @installer = Fvm::Installers::Wget.new
    Dir.mkdir( @dest )
  end
  # teardown
  def teardown
    FileUtils.rm_rf( @dest ) if File.exist?( @dest )
  end
  # fixtures directory exists
  def test_fixtures_directory_exists
    assert( File.exist?( @dest ), "Fixtures directory does not exist." )
    assert( File.directory?( @dest ), "Fixtures directory isn't a directory." )
  end
  # downloads zip file to given directory
  def test_downloads_zip_file_to_given_directory
    assert_equal( false, File.exist?( @download ), "Download file exists before downloading." )
    @installer.download( @file, @dest )
    assert_equal( true, File.exist?( @download ), "Download file doesn't exist after downloading." )
  end
  # returns filename of downloaded file
  def test_returns_filename_of_downloaded_file
    assert_equal( @download, @installer.download( @file, @dest ) )
  end
  # unzips file in given directory
  def test_unzips_file_in_given_directory
    assert_equal( false, File.exist?( File.join( @dest, 'flex_sdk_4.1.0.12345_mpl' ) ) )
    download = @installer.download( @file, @dest )
    puts "DIRECTORY CONTENTS:"
    puts Dir[ File.join( @dest, '*' ) ]
    @installer.unzip( download, @dest )
    puts "DIRECTORY CONTENTS:"
    puts Dir[ File.join( @dest, '*' ) ]
    assert_equal( true, File.exist?( File.join( @dest, 'flex_sdk_4.1.0.12345_mpl' ) ) )
  end
end