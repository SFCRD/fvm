require 'fileutils'

module Fvm
  module Installers
    class Wget < Base
=begin rdoc
  Downloads the given url into the specified path
  Returns the path to the downloaded file
=end
      def download( url, path )
        Dir.chdir( path ){ `wget #{url}` }
        File.join( path, File.basename( url ) )
      end
=begin rdoc
  Unzips the given zip archive into the specified path
  Returns the name of the archive directory
=end
      def unzip( zip, path )
        new_name = package_name( zip )
        Dir.chdir( path ){ `unzip #{File.basename( zip )} -d #{new_name}` }
        File.join( path, new_name )
      end
    end
  end
end