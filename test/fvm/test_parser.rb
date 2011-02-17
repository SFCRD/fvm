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
  # values are arrays of hashes
  def test_values_are_arrays_of_hashes
    @result.values.each do |table|
      assert_instance_of( Array, table )
      table.each do |entry|
        assert_instance_of( Hash, entry )
      end
    end
  end
  # first table has correct length
  def test_first_table_has_correct_length
    assert_equal( 1, @result.values.first.size )
  end
  # second table has correct length
  def test_second_table_has_correct_length
    assert_equal( 2, @result.values.last.size )
  end
end