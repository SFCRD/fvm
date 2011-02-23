require 'thor'

module Fvm
  module CLI
    class Thor < Thor

      # flex symlinks should go in:
      # /usr/local/bin

      # see homebrew/extend/pathname#make_relative_symlink
      desc 'install', 'Installs the specified Flex SDK'
      def install
        driver.install
      end
      
      desc 'unlink', 'Unlinks all symlinks to the current Flex SDK'
      def unlink
        driver.unlink
      end
      
      desc 'test', 'Test out some shiz'
      def test
        driver.test
      end
      

      protected

      def driver
        @driver ||= Driver.new
      end

    end
  end
end