require 'highline'

module Fvm
  module Lists
    class Base
      
      def choose!
        options = builds
        choices = Hash[ options.map( &:to_s ).zip( options ) ]
        highline.choose do |menu|
          menu.choices( *choices.keys ) do |choice|
            choices[ choice ]
          end
        end
      end
      
      def builds
        raise 'Fvm::Lists::Base.builds must be overridden in subclasses'
      end
      
      protected
      def highline
        @highline ||= HighLine.new
      end
      
    end
  end
end