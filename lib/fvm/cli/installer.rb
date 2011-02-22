module Fvm
  module CLI
    class Installer


      def install( zip_url )

      end

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