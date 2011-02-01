module Fvm
  module Builds
    class Local < Base
      attr_reader :filename
      def initialize( filename )
        @filename = filename
        @version  = File.basename( filename ).sub( /^flex_sdk_/, '' )
        @date     = File.ctime( filename )
      end
      
      def bins
        Dir[ File.join( filename, 'bin', '*' ) ].select { |f| File.executable?( f ) and File.extname( f ).empty? }.sort
      end
    end
  end
end