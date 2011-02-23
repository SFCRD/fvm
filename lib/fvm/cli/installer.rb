require 'geoffrey'
require 'fileutils'
require 'pathname'

module Fvm
  module CLI
    class Installer

      attr_reader :dir, :executables
      def initialize( dir, executables )
        @dir = Pathname.new( dir ).expand_path
        @executables = executables
      end
      
      def install( zip_url, version )
        # download the zip and unzip it
        temp = download zip_url
        # create the destination directory name for this sdk version
        dest = File.join( dir, "flex_sdk_#{version}" )
        # move the unzipped directory to the destination
        move = FileUtils.mv temp, dest
        # make all executables in bin actually executable
        make_executables_executable! dest
        # return the destination
        dest
      end
      
      def installed_builds
        
      end
      
      protected

      def download( zip_url )
        Geoffrey.package do
          url zip_url
          def install
            puts
            File.dirname file_to_install
          end
        end
      end
      
      def make_executables_executable!( dir )
        executables_in( dir ).each { |name| File.chmod( 755, name ) unless File.executable? name }
      end
      
      def executables_in( dir )
        Dir[ File.join( dir, 'bin', '*' ) ].select { |name| executables.include? File.basename( name ) }
      end
      
    end
  end
end