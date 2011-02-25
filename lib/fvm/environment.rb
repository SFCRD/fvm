#!/usr/bin/env ruby -wKU

require 'pathname'

module Fvm
  module Environment
    
    FVM_HOME = Pathname.new( '~/.fvm' ).expand_path
    
    SDK_HOME = Pathname.new( '~/Developer/SDKs' ).expand_path
    
    BIN_HOME = Pathname.new( '/usr/local/bin' ).expand_path
    
  end
end