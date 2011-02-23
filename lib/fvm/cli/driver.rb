module Fvm
  module CLI
    class Driver

      def install( options={} )
        # TODO check for explicit version to install
        # TODO check for sdk to choose from

        # Geoffrey.package do
        #         url build.zip_url
        #         
        #         def install
        #           
        #         end
        #       end
        
        # build = shell.choose Build.all
        # 
        #   if build.installed?
        #     shell.say 'This build is already installed.'
        #   else
        #     installed = installer.install build
        #     
        #     linker.link installed
        #   end
        
        begin
          builds = Fvm::CLI::Build.all
        rescue
          shell.exit 'There was a problem connecting to the FVM API. Please try again.'
        end

        build = shell.choose builds

        installed = installer.install( build.zip_url, build.version )

        linker.link( File.join( installed, 'bin' ) )
        
      end
      
      def unlink
        linker.unlink!
      end
      
      def test
        
        puts 'TEST YO'
        puts File.owned?( linker.dir )
        
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