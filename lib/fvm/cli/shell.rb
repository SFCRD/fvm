require 'highline'

module Fvm
  module CLI
    class Shell

      def choose_build
        builds = Hash[ Build.all.map { |b| [ b.version, b ].flatten } ]

        highline.choose do |m|

          m.choices *builds.keys do |choice|

            builds[ choice ]

          end
        end
      end

      protected

      def highline
        @highline ||= HighLine.new
      end

    end
  end
end