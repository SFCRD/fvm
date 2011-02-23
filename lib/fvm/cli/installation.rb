require 'pathname'
require 'versionomy'

module Fvm
  module CLI
    class Installation
      include Comparable
      
      attr_reader :dir
      def initialize( dir )
        @dir = Pathname.new( dir ).expand_path
      end
      
      def version
        @dir.basename.to_s.sub( /^flex_sdk_/, '' )
      end
      
      def active?
        Fvm::System.active?( self )
      end
      
      def to_menu
        out = [ version ]
        out.unshift '*' if active?
        out.join ' '
      end
      
      def <=> ( other )
        Versionomy.parse( version ) <=> Versionomy.parse( other.version )
      end
      
    end
  end
end