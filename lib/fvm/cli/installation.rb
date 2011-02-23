require 'pathname'

module Fvm
  module CLI
    class Installation
      
      attr_reader :dir
      def initialize( dir )
        @dir = Pathname.new( dir ).expand_path
      end
      
      def version
        @dir.basename.to_s.delete( 'flex_sdk_' )
      end
      
      def to_s
        "Flex SDK #{version}"
      end
      
    end
  end
end