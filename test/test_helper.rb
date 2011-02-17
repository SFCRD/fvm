#!/usr/bin/env ruby -wKU

require 'test/unit'

require 'fvm'

Dir[ File.join( File.dirname( __FILE__ ), 'fvm/**/test_*.rb' ) ].each { |t| require t }