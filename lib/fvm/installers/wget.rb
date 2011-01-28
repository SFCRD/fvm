module Fvm
  module Installers
    class Wget
      
      def install!( url, path )
        Dir.chdir( path ) { puts `wget #{url}` }
      end
      
    end
  end
end