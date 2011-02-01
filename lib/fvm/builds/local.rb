module Fvm
  module Builds
    
    Bin = Struct.new( :name, :path )
    
    class Local < Base
      attr_reader :filename
      def initialize( filename )
        @filename = filename
        @version  = File.basename( filename ).sub( /^flex_sdk_/, '' )
        @date     = File.ctime( filename )
      end
      
      def bins
        Dir[ binpath ].select { |f| valid_bin? f }.sort.map { |b| Bin.new( File.basename( b ), b ) }
      end
      
      protected
      def binpath
        File.join( filename, 'bin', '*' )
      end
      def valid_bin?( path )
        File.executable?( path ) and File.extname( path ).empty?
      end
    end
  end
end