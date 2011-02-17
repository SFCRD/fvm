require "test/unit"

require "fvm/manipulator"

class TestFvmManipulator < Test::Unit::TestCase
  # setup
  def setup
    @manipulator = Fvm::Manipulator.new
    @html = Nokogiri::HTML( IO.read( 'test/fixtures/parser/Simplified.html' ) )
  end
  # title node is formatted properly
  def test_title_node_is_formatted_properly
    assert_equal( 'Table Name', @manipulator.title( @html.at( Fvm::Parser::HEADER_XPATH ) ) )
  end
  # header node is formatted properly
  def test_header_node_is_formatted_properly
    assert_equal( [ 'Header', 'Version', 'One More' ], @manipulator.headers( @html.at( Fvm::Parser::TABLE_XPATH ) ) )
  end
  # rows node is formatted properly
  def test_rows_node_is_formatted_properly
    assert_equal( 2, @manipulator.rows( @html.at( Fvm::Parser::TABLE_XPATH ) ).size )
  end
  # first row is formatted properly
  def test_first_row_is_formatted_properly
    row = @manipulator.rows( @html.at( Fvm::Parser::TABLE_XPATH ) ).first
    assert_equal( [ 'Header Value', '1.2.3.4567', 'http://download?build=1.2.3.4567&amp;pkgtype=1' ], row )
  end
  # table is formatted properly
  def test_table_is_formatted_properly
    table = [ ]

    table << { }.tap do |row|
      row[ 'Header'   ] = 'Header Value'
      row[ 'Version'  ] = '1.2.3.4567'
      row[ 'One More' ] = 'http://download?build=1.2.3.4567&amp;pkgtype=1'
      row.sort
    end
    
    table << { }.tap do |row|
      row[ 'Header'   ] = 'Second Header Value'
      row[ 'Version'  ] = '1.2.3.1234'
      row[ 'One More' ] = 'http://download?build=1.2.3.1234&amp;pkgtype=1'
      row.sort
    end
    
    assert_equal( table, @manipulator.table( @html.at( Fvm::Parser::TABLE_XPATH ) ) )
  end
end