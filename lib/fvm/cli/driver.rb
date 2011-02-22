require 'highline'
require 'geoffrey'

module Fvm
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
      
    end
    
    protected
    
    def installer
      @installer ||= Fvm::Installer.new( '~/Developer/SDKs' )
    end
    
    def ui
      @ui ||= Fvm::UI.new
    end
    
  end
end