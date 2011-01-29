module Fvm
  module Linkers
    class Linker
      attr_reader :path
      def initialize( path )
        @path = path
      end
      
      def link( name, dest )
        File.symlink( dest, File.join( path, name ) )
      end
    end
  end
end