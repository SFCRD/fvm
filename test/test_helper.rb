#!/usr/bin/env ruby -wKU

require 'test/unit'

SKIP_DOWNLOAD_TESTS = true

Dir[ File.dirname( __FILE__ ) + '/fvm/**/test_*.rb' ].reject{ |t| SKIP_DOWNLOAD_TESTS and t[ /wget/ ] }.each { |t| require t }