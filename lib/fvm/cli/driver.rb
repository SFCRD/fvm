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

        build = shell.choose( Fvm::CLI::Build.all )

        installed = installer.install( build.zip_url, build.version )

        linker.link( File.join( installed, 'bin' ) )
        
      end

      protected

      def installer
        @installer ||= Installer.new( '~/Developer/SDKs' )
      end
      
      def linker
        @linker ||= Linker.new( '/usr/local/bin', [ 'asdoc', 'compc', 'mxmlc' ] )
      end

      def shell
        @shell ||= Shell.new
      end

    end
  end
end