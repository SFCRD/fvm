module Fvm
  module Lists
    class Locals < Base
      
      attr_reader :path
      def initialize( path )
        @path = path
      end
      
      
      def builds
        directories.map { |dir| create_build dir }
      end
      
      def installed?( version )
        builds.map( &:version ).include? version
      end
      
      protected
      def directories
        Dir[ File.join( @path, 'flex_sdk_*' ) ].select { |uri| File.directory?( uri ) }
      end
      def create_build( dir )
        Fvm::Builds::Local.new( dir )
      end
    end
  end
end