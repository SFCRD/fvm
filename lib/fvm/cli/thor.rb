require 'thor'

module Fvm
  module CLI
    class Thor < Thor

      desc 'install', 'Installs the specified Flex SDK'
      def install
        driver.install
      end
      
      desc 'use', 'Create symlinks to an existing Flex SDK installation'
      def use
        driver.use
      end
      
      desc 'list', 'List available installed or remote Flex SDK builds'
      def list
        driver.list
      end
      
      desc 'unlink', 'Unlinks all symlinks to the current Flex SDK'
      def unlink
        driver.unlink
      end

      protected

      def driver
        @driver ||= Driver.new
      end

    end
  end
end