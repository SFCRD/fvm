require 'thor'

module Fvm
  class CLI < Thor
    desc 'install', 'Install a specific Flex SDK version'
    def install
      puts 'TODO install'
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
      else
        puts 'list local [default]'
      end
    end
    desc 'use', 'Symlink to a specific Flex SDK version'
    def use
      puts 'TODO use'
    end
  end
end