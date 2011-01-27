#!/usr/bin/env ruby -wKU

require "test/unit"

require "fvm/parsers/flex_4"

class TestFvmParsersFlex4 < Test::Unit::TestCase
  # setup
  def setup
    @file = File.expand_path( File.join( __FILE__, '..', '..', '..', 'fixtures/parsers/flex-4-downloads.html' ) )
    @parser = Fvm::Parsers::Flex4.new
  end
  # fixture file exists
  def test_fixture_file_exists
    assert( File.exist?( @file ), "Could not find test fixture file" )
  end
  # parses tables correctly
  def test_parses_tables_correctly
    tables = @parser.parse( "file://#{@file}" )
    assert_equal( 3, tables.size )
  end
  # parses table names correctly
  def test_parses_table_names_correctly
    tables = @parser.parse( "file://#{@file}" )
    assert_equal( [ 'Latest Milestone Release Builds', 'Stable Builds', 'Nightly Builds' ], tables.map { |t| t[ :name ] } )
  end
  # milestone release columns are correct
  def test_milestone_release_columns_are_correct
    table = @parser.parse( "file://#{@file}" ).select { |t| t[ :name ].eql? 'Latest Milestone Release Builds' }.first
    table[ :builds ].each do |obj|
      [ 'Milestone', 'Build', 'Build Date', 'Adobe Flex SDK', 'Open Source Flex SDK', 'Adobe Add-ons' ].each do |col|
        assert_not_nil( obj[ col ], "Object #{obj.inspect} does not have expected key '#{col}'" )
      end
    end
  end
  # milestone release builds are correct
  def test_milestone_release_builds_are_correct
    table = @parser.parse( "file://#{@file}" ).select { |t| t[ :name ].eql? 'Latest Milestone Release Builds' }.first
    versions = [ '3.5.0.12683', '3.4.0.9271', '3.3.0.4852', '3.2.0.3958', '3.1.0.2710', '3.0.0.477' ]
    assert_equal( versions, table[ :builds ].map { |b| b[ 'Build' ] } )
  end
  # stable columns are correct
  def test_stable_columns_are_correct
    table = @parser.parse( "file://#{@file}" ).select { |t| t[ :name ].eql? 'Stable Builds' }.first
    table[ :builds ].each do |obj|
      [ 'Build', 'Build Date', 'Adobe Flex SDK', 'Open Source Flex SDK', 'Adobe Add-ons' ].each do |col|
        assert_not_nil( obj[ col ], "Object #{obj.inspect} does not have expected key '#{col}'" )
      end
    end
  end
  # stable builds are correct
  def test_stable_builds_are_correct
    table = @parser.parse( "file://#{@file}" ).select { |t| t[ :name ].eql? 'Stable Builds' }.first
    versions = [ '3.4.1.10084', '3.4.0.6955', '3.3.0.4589', '3.0.2.2113', '3.0.1.1732', '3.0.1.1092' ]
    assert_equal( versions, table[ :builds ].map { |b| b[ 'Build' ] } )
  end
  # nightly columns are correct
  def test_nightly_columns_are_correct
    table = @parser.parse( "file://#{@file}" ).select { |t| t[ :name ].eql? 'Nightly Builds' }.first
    table[ :builds ].each do |obj|
      [ 'Build', 'Changes', 'Build Date', 'Adobe Flex SDK', 'Open Source Flex SDK', 'Adobe Add-ons' ].each do |col|
        assert_not_nil( obj[ col ], "Object #{obj.inspect} does not have expected key '#{col}'" )
      end
    end
  end
  # nightly builds are correct
  def test_nightly_builds_are_correct
    table = @parser.parse( "file://#{@file}" ).select { |t| t[ :name ].eql? 'Nightly Builds' }.first
    versions = [ '3.6.0.16736', '3.6.0.16677', '3.6.0.16581', '3.6.0.16321', '3.6.0.15427', '3.6.0.13443', '3.6.0.13426', '3.6.0.13384', '3.6.0.13349', '3.6.0.13285' ]
    assert_equal( versions, table[ :builds ].map { |b| b[ 'Build' ] } )
  end
end