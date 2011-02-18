require 'thor'
require 'rainbow'

module Fvm
  class CLI < Thor
    
    # flex symlinks should go in:
    # /usr/local/bin
    
    # see homebrew/extend/pathname#make_relative_symlink
    
    def install
      driver.install
    end
    
    protected
    
    def driver
      @driver ||= ::Driver.new
    end
    
  end
end