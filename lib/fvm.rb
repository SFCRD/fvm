module Fvm
  
  module CLI
    autoload :Build,        'fvm/cli/build'
    autoload :Installer,    'fvm/cli/installer'
    autoload :Installation, 'fvm/cli/installation'
    autoload :Linker,       'fvm/cli/linker'
    autoload :Shell,        'fvm/cli/shell'
    autoload :Driver,       'fvm/cli/driver'
    autoload :Thor,         'fvm/cli/thor'
  end
  
  # TODO move into module
  autoload :Manipulator, 'fvm/manipulator'
  
  autoload :Parser, 'fvm/parser'

  
  
  module System
    def self.active_version?
      active_version.nil? == false
    end
    
    def self.active_version
      @@active_version ||= find_active_version
    end
    
    def self.active?( build )
      active_version? ? active_version.version.eql?( build.version ) : false
    end
    
    protected
    
    def self.find_active_version
      mxmlc = `which mxmlc`
      mxmlc.empty? ? nil : CLI::Installation.new( Pathname.new( `readlink #{mxmlc}` ).join( '..', '..' ) )
    end
  end

  
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