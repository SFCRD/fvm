module Fvm
  module CLI
    class Driver
=begin rdoc
  Installs a version of the Flex SDK and creates symlinks to the included binaries.
  
  If no options are provided, FVM will fetch all available builds and present them to
  the user as an interactive menu.
  
  Because we're trying to stay honest, the user will be prompted to agree to the MPL
  license no matter what.
  
  OPTIONS
  
    -v, --version Specify a version of the Flex SDK to install
    
    -s, --sdk Only present a menu containing builds from the given SDK name
    
=end
      def install( options )

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
        
        shell.exit "You must agree to the MPL terms before installing the Flex SDK." unless shell.mpl?
          
        installed = installer.install build.zip_url, build.version

        linker.link File.join( installed, 'bin' )

        shell.props "Flex SDK version #{build.version} successfully installed to #{installed}"
        
      end
=begin rdoc
  Select an installed version of the Flex SDK to link to.
  
  OPTIONS
  
  -v, --version Create symlinks for the specified version instead of selecting from a menu.
  
=end
      def use( options )
        shell.exit "The 'use' task is not finished. Sorry!"
      end
=begin rdoc
  List Flex SDK builds installed locally. Will also show which build is currently linked.
  
  OPTIONS
  
  -r, --remote List available remote builds.
  
=end
      def list( options )
        if options.remote?
          begin
            builds = Build.all
          rescue
            shell.exit 'There was a problem connecting to the FVM API. Please try again.'
          end
          
          shell.list builds
        else
          installations = installer.installations
          
          shell.exit "No Flex SDK versions installed. Run 'fvm install' to install some!" if installations.empty?
          
          shell.list installations
        end
      end
=begin rdoc
  Removes all symlinks created by FVM.
=end
      def unlink
        linker.unlink!
        shell.props "All Flex SDK symlinks successfully removed."
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