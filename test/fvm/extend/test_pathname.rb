require "test/unit"

require "fvm/extend/pathname"

class TestFvmExtendPathname < Test::Unit::TestCase
  # to_bash returns a string
  def test_to_bash_returns_a_string
    path = Pathname.new( '~/Developer/SDKs' )
    assert_instance_of( String, path.to_bash )
  end
  # to_bash replaces user home with home environment variable
  def test_to_bash_replaces_user_home_with_home_environment_variable
    path = Pathname.new( '~/Developer/SDKs' )
    assert_equal( '$HOME/Developer/SDKs', path.to_bash )
  end
  # to_bash equals to_s for pathnames without user home
  def test_to_bash_equals_to_s_for_pathnames_without_user_home
    path = Pathname.new( '/usr/local/bin' )
    assert_equal( path.to_s, path.to_bash )
  end
end