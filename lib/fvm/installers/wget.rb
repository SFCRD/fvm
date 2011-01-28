module Fvm
  module Installers
    class Wget
      
      def install!( url, path )
        Dir.chdir( path ) { `wget #{url}` }
      end
      
    end
  end
end