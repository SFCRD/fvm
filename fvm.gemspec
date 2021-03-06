# -*- encoding: utf-8 -*-

$: << File.join( File.dirname( __FILE__ ), 'lib' )

require 'fvm/version'

Gem::Specification.new do |s|
  s.name        = 'fvm'
  s.version     = Fvm::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = [ 'Jeremy Ruppel' ]
  s.email       = [ 'jeremy.ruppel@gmail.com' ]
  s.homepage    = 'https://github.com/SFCRD/fvm'
  s.summary     = 'Flex SDK version manager'
  s.description = 'Flex SDK version manager'

  s.add_dependency 'thor',           '0.14.3'
  s.add_dependency 'highline',       '~> 1.6'
  s.add_dependency 'nokogiri',       '~> 1.4.4'
  s.add_dependency 'activeresource', '~> 3.0.4'
  s.add_dependency 'geoffrey',       '~> 1.1.3'
  s.add_dependency 'versionomy',     '~> 0.4.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename( f ) }
  s.require_paths = [ 'lib' ]
end