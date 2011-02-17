require 'nokogiri'
require 'cgi'

module Fvm
=begin rdoc
  Provides methods to manipulate the markup of a Flex SDK download page into usable data
=end
  class Manipulator
=begin rdoc
  Formats the title node of a table
=end
    def title( node )
      node.text.strip
    end
=begin rdoc
  Formats a table into an array of hashes (rows)
=end
    def table( node )
      rows( node ).map { |row| Hash[ headers( node ).zip( row ).sort ] }
    end
=begin rdoc
  Formats table header nodes into an array
=end
    def headers( node )
      node.xpath( 'table/tbody/tr/th' ).map( &:text ).map( &:strip )
    end
=begin rdoc
  Formats table rows into an associative array
=end
    def rows( node )
      node.xpath( 'table/tbody/tr[td]' ).map { |row| row.xpath( 'td' ).map { |node| text_or_link node } }
    end
    
    protected
=begin rdoc
  Decides whether a table cell is a text or link. If it is a link, it is html-escaped.
=end
    def text_or_link( node )
      node.at( 'a' ).nil? ? node.text.strip : CGI.escapeHTML( node.at( 'a' )[ 'href' ] )
    end
    
  end
end