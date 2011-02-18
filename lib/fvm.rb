module Fvm
  # autoload :CLI, 'fvm/cli'
  
  autoload :Manipulator, 'fvm/manipulator'
  
  autoload :Parser, 'fvm/parser'
  
  autoload :Build, 'fvm/build'
  
  autoload :UI, 'fvm/ui'
  
  autoload :Driver, 'fvm/driver'
  
  # highline = HighLine.new( STDIN, STDOUT, :auto )
  # 
  # highline.say @confirmer.license
  # 
  # answer = highline.agree @confirmer.agreement
  # 
  # puts '_' * 50
  # puts answer
  
  
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