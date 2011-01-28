require 'thor'
require 'highline'
require 'rainbow'

module Fvm
  class CLI < Thor
    desc 'install', 'Install a specific Flex SDK version'
    def install
      build = remotes.choose!
      
      if locals.installed? build
        puts "Flex SDK build #{build.version} already installed locally"
      else
        installer.install build
        linker.link build
      end
      
    end
    desc 'list', 'List available Flex SDK versions'
    method_option :local, :type => :boolean, :default => false, :aliases => "-l", :desc => "List existing Flex SDK installations"
    method_option :remote, :type => :boolean, :default => false, :aliases => "-r", :desc => "List remote Flex SDK downloads"
    def list
      puts 'LIST!'
      if options.local?
        puts 'list local'
      elsif options.remote?
        puts 'list remote'
        
        parser = Fvm::Parsers::Flex4.new
        
        tables = parser.parse( "http://opensource.adobe.com/wiki/display/flexsdk/Download+Flex+4" )
        
        builds = [ ]
        
        tables.each do |table|
          
          puts table[ :name ].color( :black ).bright
          
          table[ :builds ].each do |build|
            
            builds << Fvm::Builds::Remote.new( build[ 'Build' ], build[ 'Build Date' ] )
            
            puts " * %s %s %s" % [ build[ 'Build' ], build[ 'Build Date' ], build[ 'Milestone' ] || '' ]
            
          end
          
        end
        
        
        
      else
        puts 'list local [default]'
      end
    end
    desc 'use', 'Symlink to a specific Flex SDK version'
    def use
      puts 'TODO use'
      
      build = locals.choose!
      
      if build.active?
        puts "Flex SDK build #{build.version} already active"
      else
        linker.unlink!
        linker.link build
      end
      
    end
    
    protected
    def remotes
      @remotes ||= Fvm::Lists::Remotes.new
    end
    def locals
      @locals ||= Fvm::Lists::Locals.new
    end
    def linker
      @linker ||= Fvm::Linker.new
    end
    def installer
      @installer ||= Fvm::Installer.new
    end
  end
end