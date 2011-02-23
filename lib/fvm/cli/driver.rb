module Fvm
  module CLI
    class Driver

      def install( options )
        # TODO check for explicit version to install
        # TODO check for sdk to choose from

        build = ui.choose_build

        # Geoffrey.package do
        #         url build.zip_url
        #         
        #         def install
        #           
        #         end
        #       end
        
        build = shell.choose Build.all

        if build.installed?
          shell.say 'This build is already installed.'
        else
          installed = installer.install build
          
          linker.link installed
        end
        
      end

      protected

      def installer
        @installer ||= Installer.new( '~/Developer/SDKs' )
      end
      
      def linker
        @linker ||= Linker.new( '/usr/local/bin' )
      end

      def shell
        @shell ||= Shell.new
      end

    end
  end
end