require 'thor'

module Fvm
  module CLI
    class Thor < Thor
=begin rdoc
  See Fvm::CLI::Driver#install
=end
      desc 'install', 'Installs the specified Flex SDK'
      method_options %w| version -v | => :string, %w| sdk -s | => :string
      def install
        driver.install options
      end
=begin rdoc
  See Fvm::CLI::Driver#use
=end
      desc 'use', 'Create symlinks to an existing Flex SDK installation'
      def use
        driver.use
      end
=begin rdoc
  See Fvm::CLI::Driver#list
=end
      desc 'list', 'List available installed or remote Flex SDK builds'
      method_options %w| remote -r | => :boolean
      def list
        driver.list options
      end
=begin rdoc
  See Fvm::CLI::Driver#unlink
=end
      desc 'unlink', 'Unlinks all symlinks to the current Flex SDK'
      def unlink
        driver.unlink
      end
      
      desc 'which', 'Prints the currently-linked Flex SDK version, if any'
      def which
        driver.which
      end
      
      desc 'home', 'Prints the current home of the Flex SDK, if any'
      def home
        driver.home
      end

      protected

      def driver
        @driver ||= Driver.new
      end

    end
  end
end