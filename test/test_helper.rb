#!/usr/bin/env ruby -wKU

require 'test/unit'

Dir[ File.dirname( __FILE__ ) + '/fvm/**/test_*.rb' ].each { |t| require t }