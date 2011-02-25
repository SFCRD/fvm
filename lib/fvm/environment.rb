#!/usr/bin/env ruby -wKU

require 'pathname'

module Fvm
  module Environment
    
    FVM_HOME = Pathname.new( '~/.fvm' ).expand_path
    
  end
end