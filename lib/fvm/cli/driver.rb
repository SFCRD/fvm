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
        
        shell.warn_restart!
        
      end
=begin rdoc
  Select an installed version of the Flex SDK to link to.  
=end
      def use
        
        installations = installer.installations
        
        shell.exit "No Flex SDK versions installed. Run 'fvm install' to install some!" if installations.empty?
        
        installation = shell.choose installations
        
        linker.link File.join( installation.dir, 'bin' )
        
        shell.props "Now using Flex SDK version #{installation.version}"
        
        shell.warn_restart!
        
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
=begin rdoc
  Prints the active Flex SDK version number
  
  OPTIONS
  
  -c, --chomp `print` instead of `puts`
=end
      def which( options )
        if Fvm::System.active_version?
          options.chomp? ? print( Fvm::System.active_version.version ) : puts( Fvm::System.active_version.version )
        else
          print ''
        end
      end
=begin rdoc
  Prints the active Flex SDK home directory
  
  OPTIONS
  
  -c, --chomp `print` instead of `puts`
=end
      def home( options )
        installations = installer.installations.select( &:active? )
        if installations.any?
          options.chomp? ? print( installations.first.dir ) : puts( installations.first.dir )
        else
          print ''
        end
      end
=begin rdoc
  Prints the location of the fvm-restart script
  
  OPTIONS
  
  -c, --chomp `print` instead of `puts`
=end
      def restart( options )
        options.chomp? ? print( restart_script_path ) : puts( restart_script_path )
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
      
      def restart_script_path
        File.expand_path( File.join( `gem which fvm`.chomp, '..', '..', 'scripts', 'fvm' ) )
      end

    end
  end
end