module Fvm
  module Builds
    class Remote < Base
      def initialize( version, date )
        @version = version
        @date = Time.parse( date )
      end
      def url
        "http://fpdownload.adobe.com/pub/flex/sdk/builds/flex4/flex_sdk_#{version}_mpl.zip"
      end
    end
  end
end