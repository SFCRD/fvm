module Fvm
  module Linkers
    class Linker
      attr_reader :path
      def initialize( path )
        @path = path
      end
      
      def link( name, dest )
        File.join( path, name ).tap { |link| File.symlink( dest, link ) }
      end
      
      def unlink( name )
        File.delete( File.join( path, name ) )
      end
      
      def linked?( name )
        File.exist?( File.join( path, name ) )
      end
    end
  end
end