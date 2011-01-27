require 'time'

module Fvm
  module Builds
    class Base
      attr_reader :version, :date
      def initialize( version, date )
        @version = version
        @date = date
      end
    end
  end
end