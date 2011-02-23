module Fvm
  module CLI
    class Installer

      attr_reader :dir
      def initialize( dir )
        @dir = dir
      end
      
      
      def install( zip_url )

      end
      
      def installed_builds
        
      end
      
      protected

      def download( zip_url )
        Geoffrey.package do
          url zip_url
          def install

          end
        end
      end
    end
  end
end