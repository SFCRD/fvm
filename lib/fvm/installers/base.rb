module Fvm
  module Installers
    PACKAGE_PATTERN = /flex_sdk_(\d+\.)+\d+/
    class Base
      def package_name( filename )
        filename[ PACKAGE_PATTERN ]
      end
    end
  end
end