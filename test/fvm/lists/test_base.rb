#!/usr/bin/env ruby -wKU

require "test/unit"

require "fvm/lists/base"

class TestFvmListsBase < Test::Unit::TestCase
  # setup
  def setup
    @list = Fvm::Lists::Base.new
  end
  # raises error if builds is called
  def test_raises_error_if_builds_is_called
    assert_raise( RuntimeError ) { @list.builds }
  end
  # has choose method
  def test_has_choose_method
    assert_respond_to( @list, :choose! )
  end
end