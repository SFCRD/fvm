#!/usr/bin/env ruby -wKU

require 'test/unit'

Dir[ File.dirname( __FILE__ ) + '/fvm/**/test_*.rb' ].reject{ |t| t[ /wget/ ] }.each { |t| require t }