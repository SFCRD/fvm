module Fvm
  # autoload :CLI, 'fvm/cli'
  
  autoload :Manipulator, 'fvm/manipulator'
  
  autoload :Parser, 'fvm/parser'
  
  autoload :Build, 'fvm/build'
  
  
  # require 'highline'
  # 
  # @term = HighLine.new( STDIN, STDOUT, :auto )
  # 
  # # @term.wrap_at = :auto
  # 
  # @term.say @confirmer.license
  
  
  # module Builds
  #   autoload :Base, 'fvm/builds/base'
  #   autoload :Local, 'fvm/builds/local'
  #   autoload :Remote, 'fvm/builds/remote'
  # end
  # 
  # module Parsers
  #   autoload :Flex4, 'fvm/parsers/flex_4'
  # end
  # 
  # module Lists
  #   autoload :Base, 'fvm/lists/base'
  #   autoload :Locals, 'fvm/lists/locals'
  #   autoload :Remotes, 'fvm/lists/remotes'
  # end
  # 
  # module Installers
  #   autoload :Base, 'fvm/installers/base'
  #   autoload :Wget, 'fvm/installers/wget'
  # end
  # 
  # module Linkers
  #   autoload :Linker, 'fvm/linkers/linker'
  # end
end