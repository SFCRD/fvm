module Fvm
  autoload :CLI, 'fvm/cli'
  
  module Builds
    autoload :Base, 'fvm/builds/base'
    autoload :Local, 'fvm/builds/local'
    autoload :Remote, 'fvm/builds/remote'
  end
  
  module Parsers
    autoload :Flex4, 'fvm/parsers/flex_4'
  end
  
  module Lists
    autoload :Base, 'fvm/lists/base'
    autoload :Local, 'fvm/lists/local'
    autoload :Remote, 'fvm/lists/remote'
  end
end