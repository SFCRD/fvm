require 'time'

module Fvm
  module Builds
    class Base
      attr_reader :version, :date
      def initialize( version, date )
        @version = version
        @date = date
      end
      def to_s
        version
      end
    end
  end
end