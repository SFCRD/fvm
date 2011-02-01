require 'thor'
require 'rainbow'

module Fvm
  class CLI < Thor
    
    desc 'install', 'Install a specific Flex SDK version'
    def install
      build = remotes.choose!
      
      if locals.installed? build.version
        puts "Flex SDK build #{build.version} already installed locally"
      else
        puts "Installing Flex SDK build #{build.version} from #{build.url} to #{locals.path}"

        download = installer.download( build.url, locals.path )
        
        puts "Unzipping and installing #{download}..."
        
        unzipped = installer.unzip( download, locals.path )
        
        puts "Installed Flex SDK build #{build.version} to #{unzipped}".color( :green )
        
        puts "Cleaning up..."
        
        FileUtils.rm_rf download
        
        puts "Creating symlinks..."
        
        local = Fvm::Builds::Local.new( unzipped )
        
        local.bins.map { |bin| [ File.basename( bin ), bin ] }.each do |bin, path|
          
          linker.unlink( bin ) if linker.linked?( bin )
          
          linker.link( bin, path )
          
        end

      end
      
    end
    
    desc 'unlink', 'Removes symlinks for executables'
    def unlink
      # find all possible installed symlinks
      bins = locals.builds.map( &:bins ).flatten.map { |bin| File.basename( bin ) }.uniq
      # unlink each one if it is currently linked
      bins.each { |bin| linker.unlink( bin ) if linker.linked?( bin ) }
    end
    
    desc 'list', 'List available Flex SDK versions'
    method_option :local, :type => :boolean, :default => false, :aliases => "-l", :desc => "List existing Flex SDK installations"
    method_option :remote, :type => :boolean, :default => false, :aliases => "-r", :desc => "List remote Flex SDK downloads"
    def list
      if options.local?
        puts locals.builds.map( &:version )
      elsif options.remote?
        puts remotes.builds.map( &:version )
      else
        puts locals.builds.map( &:version )
      end
    end
    # desc 'list', 'List available Flex SDK versions'
    # method_option :local, :type => :boolean, :default => false, :aliases => "-l", :desc => "List existing Flex SDK installations"
    # method_option :remote, :type => :boolean, :default => false, :aliases => "-r", :desc => "List remote Flex SDK downloads"
    # def list
    #   puts 'LIST!'
    #   if options.local?
    #     puts 'list local'
    #   elsif options.remote?
    #     puts 'list remote'
    #     
    #     parser = Fvm::Parsers::Flex4.new
    #     
    #     tables = parser.parse( "http://opensource.adobe.com/wiki/display/flexsdk/Download+Flex+4" )
    #     
    #     builds = [ ]
    #     
    #     tables.each do |table|
    #       
    #       puts table[ :name ].color( :black ).bright
    #       
    #       table[ :builds ].each do |build|
    #         
    #         builds << Fvm::Builds::Remote.new( build[ 'Build' ], build[ 'Build Date' ] )
    #         
    #         puts " * %s %s %s" % [ build[ 'Build' ], build[ 'Build Date' ], build[ 'Milestone' ] || '' ]
    #         
    #       end
    #       
    #     end
    #     
    #     
    #     
    #   else
    #     puts 'list local [default]'
    #   end
    # end
    # desc 'use', 'Symlink to a specific Flex SDK version'
    # def use
    #   puts 'TODO use'
    #   
    #   build = locals.choose!
    #   
    #   if build.active?
    #     puts "Flex SDK build #{build.version} already active"
    #   else
    #     linker.unlink!
    #     linker.link build
    #   end
    #   
    # end
    
    protected
    def testing?
      true
    end
    def remotes_url
      if testing?
        url = File.expand_path( File.join( File.dirname( __FILE__ ), '..', '..', 'test', 'fixtures/parsers/flex-4-downloads.html' ) )
        "file://#{url}"
      else
        "http://opensource.adobe.com/wiki/display/flexsdk/Download+Flex+4"
      end
    end
    def remotes
      @remotes ||= Fvm::Lists::Remotes.new( remotes_url )
    end
    def locals_path
      if testing?
        File.expand_path( File.join( File.dirname( __FILE__ ), '..', '..', 'test', 'fixtures/lists' ) )
      else
        '~/Developer/SDKs/'
      end
    end
    def locals
      @locals ||= Fvm::Lists::Locals.new( locals_path )
    end
    def links_path
      if testing?
        File.expand_path( File.join( File.dirname( __FILE__ ), '..', '..', 'test', 'fixtures/lists' ) )
      else
        '/opt/local/bin'
      end
    end
    def linker
      @linker ||= Fvm::Linkers::Linker.new( locals_path )
    end
    def installer
      @installer ||= Fvm::Installers::Wget.new
    end
  end
end