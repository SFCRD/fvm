require 'thor'

module Fvm
  class CLI < Thor
    desc 'test', 'test a command'
    def test
      puts 'wow thats a sweet test dawg'
    end
  end
end