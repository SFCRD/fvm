#!/usr/bin/env ruby -wKU

require "test/unit"

require "fvm/installers/base"

class TestFvmInstallersBase < Test::Unit::TestCase
  # package pattern matches valid flex sdk package names
  def test_package_pattern_matches_valid_flex_sdk_package_names
    assert_match( Fvm::Installers::PACKAGE_PATTERN,    'flex_sdk_4.1.0.16032' )
    assert_match( Fvm::Installers::PACKAGE_PATTERN,    'flex_sdk_4.1.0.1603' )
    assert_match( Fvm::Installers::PACKAGE_PATTERN,    'flex_sdk_4.1.0.160' )
    assert_match( Fvm::Installers::PACKAGE_PATTERN,    'flex_sdk_4.1.0.16' )
    assert_match( Fvm::Installers::PACKAGE_PATTERN,    'flex_sdk_4.1.0.1' )
    assert_match( Fvm::Installers::PACKAGE_PATTERN,    'flex_sdk_4.1.01' )
    assert_match( Fvm::Installers::PACKAGE_PATTERN,    'flex_sdk_4.1.0' )
    assert_match( Fvm::Installers::PACKAGE_PATTERN,    'flex_sdk_4.11' )
    assert_match( Fvm::Installers::PACKAGE_PATTERN,    'flex_sdk_4.1' )
  end
  # package name gets the package name from a filename
  def test_package_name_gets_the_package_name_from_a_filename
    installer = Fvm::Installers::Base.new
    assert_equal( 'flex_sdk_4.1.0.16032', installer.package_name( '/dir/flex_sdk_4.1.0.16032_mpl.zip' ) )
  end
end