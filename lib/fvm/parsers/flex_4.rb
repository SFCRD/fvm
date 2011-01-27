require 'mechanize'

module Fvm
  module Parsers
    class Flex4
      def parse( url )
        Array.new.tap do |sets|
          page = browser.get( url )
          page.search( 'h3' ).each do |header|
            
            name = header.text.strip
            rows = header.next_element.at( 'table/tbody' )
            head = rows.xpath( 'tr[th]' ).xpath( 'th' ).map( &:text ).map( &:strip )
            blds = rows.xpath( "tr[td]" ).map { |row| Hash[ head.zip( row.xpath( 'td' ).map( &:text ).map( &:strip ) ) ] }

            sets << { :name => name, :builds => blds }
          end
        end
      end
      
      protected
      def browser
        @browser ||= ::Mechanize.new
      end
    end
  end
end