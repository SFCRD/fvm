require 'pathname'

class Pathname
  
  def to_bash
    expand_path.to_s.sub( /^#{File.expand_path( '~' )}/, '$HOME')
  end
  
end