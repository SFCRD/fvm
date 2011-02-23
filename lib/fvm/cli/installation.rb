require 'pathname'

module Fvm
  module CLI
    class Installation
      
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
      
    end
  end
end