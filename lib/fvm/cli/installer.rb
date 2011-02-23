require 'geoffrey'
require 'fileutils'

module Fvm
  module CLI
    class Installer

      attr_reader :dir
      def initialize( dir )
        @dir = File.expand_path( dir )
      end
      
      def install( zip_url, version )
        temp = download zip_url
        dest = File.join( dir, "flex_sdk_#{version}" )
        move = FileUtils.mv temp, dest
        dest if move.eql? 0
      end
      
      def installed_builds
        
      end
      
      protected

      def download( zip_url )
        Geoffrey.package do
          url zip_url
          def install
            File.dirname file_to_install
          end
        end
      end
    end
  end
end