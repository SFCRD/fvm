module Fvm
  module Lists
    class Remotes < Base
      attr_reader :url
      def initialize( url )
        @url = url
      end

      def builds
        parser.parse( url ).map { |group| group[ :builds ] }.flatten.map { |build| create_build build }
      end
      
      protected
      def parser
        @parser ||= Fvm::Parsers::Flex4.new
      end
      def create_build( build )
        Fvm::Builds::Remote.new( build[ 'Build' ], build[ 'Build Date' ] )
      end
      
      
    end
  end
end