require 'highline'

module Fvm
  class Driver
    
    def install
      
      build = ui.choose_build
      
      puts build.inspect
      
    end
    
    protected
    
    def ui
      @ui ||= Fvm::UI.new
    end
    
  end
end