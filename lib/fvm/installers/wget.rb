require 'fileutils'

module Fvm
  module Installers
    class Wget < Base
=begin rdoc
  Shortcut to #download, #unzip, and #rename a file.
=end
      def install( url, path )
        rename( unzip( download( url, path ), path ), path )
      end
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
        Dir.chdir( path ){ `unzip #{File.basename( zip )}` }
        File.join( path, File.basename( zip, '.zip' ) )
      end
=begin rdoc
  Renames the given directory to match our Flex SDK dir naming convention
  Returns the new path of the renamed directory
=end
      def rename( dir, path )
        new_name = package_name( dir )
        Dir.chdir( path ){
          FileUtils.cp_r( File.basename( dir ), new_name )
          FileUtils.rm_r( File.basename( dir ) )
        }
        File.join( path, new_name )
      end
    end
  end
end