require 'thor'
require 'rainbow'

module Fvm
  class CLI < Thor
    
    desc 'install', 'Install a specific Flex SDK version'
    def install
      # check for write perms
      check_for_write_perms!
      
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
        # unlink all symlinks
        unlink
        # link to the selected build's bins
        local.bins.each { |bin| linker.link( bin.name, bin.path ) }
      end
      
    end
    
    desc 'unlink', 'Removes symlinks for executables'
    def unlink
      # check for write perms
      check_for_write_perms!
      # find all possible installed symlinks
      bins = locals.builds.map( &:bins ).flatten
      # unlink each one if it is currently linked
      bins.map( &:name ).uniq.each { |name| linker.unlink( name ) if linker.linked?( name ) }
    end
    
    desc 'list', 'List available Flex SDK versions'
    method_option :remote, :type => :boolean, :default => false, :aliases => "-r", :desc => "List remote Flex SDK downloads"
    def list
      if options.remote?
        puts remotes.builds.map( &:to_s )
      else
        puts locals.builds.map( &:to_s )
      end
    end
    
    desc 'use', 'Link to a specific installed Flex SDK version'
    def use
      # check for write perms
      check_for_write_perms!
      # choose a local build
      local = locals.choose!
      # unlink all symlinks
      unlink
      # link to the selected build's bins
      local.bins.each { |bin| linker.link( bin.name, bin.path ) }
    end
    
    protected
    
    def check_for_write_perms!
      unless File.writable? links_path
        puts "This command requires write access to #{links_path} to manage symlinks. Please re-run as root with sudo.".color( :red ).bright
        exit
      end
    end
    
    def remotes_url
      "http://opensource.adobe.com/wiki/display/flexsdk/Download+Flex+4"
    end
    
    def remotes
      @remotes ||= Fvm::Lists::Remotes.new( remotes_url )
    end
    
    def locals_path
      File.expand_path '~/Developer/SDKs/'
    end
    
    def locals
      @locals ||= Fvm::Lists::Locals.new( locals_path )
    end
    
    def links_path
      '/opt/local/bin'
    end
    
    def linker
      @linker ||= Fvm::Linkers::Linker.new( links_path )
    end
    
    def installer
      @installer ||= Fvm::Installers::Wget.new
    end
  end
end