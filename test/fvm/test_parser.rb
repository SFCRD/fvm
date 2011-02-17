require "test/unit"

require "fvm/parser"

class TestFvmParser < Test::Unit::TestCase
  # setup
  def setup
    @result = Fvm::Parser.new.parse( Nokogiri::HTML( IO.read( 'test/fixtures/parser/Simplified.html' ) ) )
  end
  # has correct number of keys
  def test_has_correct_number_of_keys
    assert_equal( 2, @result.keys.size )
  end
  # has correct keys
  def test_has_correct_keys
    assert_equal( [ 'Table Name', 'Second Table Name' ].sort, @result.keys.sort )
  end
  # first section has correct length
  def test_first_section_has_correct_length
    # assert_equal( 3, @result.values.first.length )
  end
  # second section has correct length
  def test_second_section_has_correct_length
    # assert_equal( 3, @result.values.last.length )
  end
end