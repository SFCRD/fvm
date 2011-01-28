require 'thor'
require 'highline'
require 'rainbow'

module Fvm
  class CLI < Thor
    desc 'install', 'Install a specific Flex SDK version'
    def install
      puts 'TODO install'
      
      
      highline.choose do |menu|
        menu.index = :letter
        menu.index_suffix = ") "
        menu.prompt = "Please choose your favorite programming language?  "
        menu.choice :ruby do say("Good choice!") end
        menu.choices(:python, :perl) do say("Not from around here, are you?") end
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
    end
    
    protected
    def highline
      @highline ||= Highline.new
    end
  end
end