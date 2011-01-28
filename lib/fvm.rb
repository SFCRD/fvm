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
  
end