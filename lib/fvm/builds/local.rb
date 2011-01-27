module Fvm
  module Builds
    class Local < Base
      attr_reader :filename
      def initialize( filename )
        @filename = filename
        @version  = File.basename( filename ).sub( /^flex_sdk_/, '' )
        @date     = File.ctime( filename )
      end
    end
  end
end