module Fvm
  module Builds
    class Remote < Base
      def initialize( version, date )
        @version = version
        @date = Time.parse( date )
      end
    end
  end
end