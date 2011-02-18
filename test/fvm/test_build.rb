require "test/unit"

require "fvm/build"

class TestFvmBuild < Test::Unit::TestCase
  def test_case_name
    builds = Build.all
    
    puts builds
  end
end