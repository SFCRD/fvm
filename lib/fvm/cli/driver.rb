module Fvm
  module CLI
    class Driver

      def install( options={} )

        if options.version?
          
          begin
            builds = Fvm::CLI::Build.version( options.version )
          rescue
            shell.exit 'There was a problem connecting to the FVM API. Please try again.'
          end
          
          shell.exit "No Flex SDK build found with version #{options.version}" if builds.empty?
          build = builds.first
          
        elsif options.sdk?
          
          begin
            builds = Fvm::CLI::Build.sdk( options.sdk )
          rescue
            shell.exit 'There was a problem connecting to the FVM API. Please try again.'
          end
          
          shell.exit "No Flex SDK build found in SDK #{options.sdk}" if builds.empty?
          build = shell.choose builds
          
        else
          
          begin
            builds = Fvm::CLI::Build.all
          rescue
            shell.exit 'There was a problem connecting to the FVM API. Please try again.'
          end
          
          build = shell.choose builds
          
        end
        
        installed = installer.install build.zip_url, build.version

        linker.link File.join( installed, 'bin' )
        
        shell.props "Flex SDK version #{build.version} successfully installed to #{installed}"
        
      end
      
      def use( options={} )
        shell.exit "The 'use' task is not finished. Sorry!"
      end
      
      def list( options={} )
        shell.exit "The 'list' task is not finished. Sorry!"
      end
      
      def unlink
        linker.unlink!
      end

      protected
      
      def executables
        %w| asdoc compc mxmlc |
      end

      def installer
        @installer ||= Installer.new( '~/Developer/SDKs', executables )
      end
      
      def linker
        @linker ||= Linker.new( '/usr/local/bin', executables )
      end

      def shell
        @shell ||= Shell.new
      end

    end
  end
end