require 'zip/zip'
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

        

        Dir.chdir( path ){
          `unzip #{File.basename( zip )}`
          # Zip::ZipFile.open( File.basename( zip ) ) do |z|
          #             z.entries.each do |f|
          #               FileUtils.mkdir_p( File.dirname( f.name ) )
          #               puts f.name
          #               f.extract
          #               # z.extract( f, File.join( path, f ) )
          #             end
          #           end
        }

        # `unzip #{zip} -d #{path}`
        # Dir.chdir( path ){ `unzip #{File.basename( zip )}` }
        # package = File.join( File.dirname( zip ), package_name( zip ) )
        # extract = File.join( File.dirname( zip ), File.basename( zip, '.zip' ) )
        # res = `unzip #{zip} -d #{File.dirname( zip )}`
        # puts "EXTRACTED FILE NOT FOUND!: #{extract}" unless File.exist?( extract )
        # 
        # puts '_' * 50
        # puts res
        # puts '_' * 50
        # 
        # File.rename( extract, package )
        # package
      end
      
      def rename( path )
        
      end
      
    end
  end
end