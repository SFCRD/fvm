require 'nokogiri'
require 'cgi'

module Fvm
  class Manipulator
    
    def title( node )
      node.text.strip
    end
    
    def table( node )
      rows( node ).map { |row| headers( node ).zip( row ).sort }
    end
    
    def headers( node )
      node.xpath( 'table/tbody/tr/th' ).map( &:text ).map( &:strip )
    end
    
    def rows( node )
      node.xpath( 'table/tbody/tr[td]' ).map { |row| row.xpath( 'td' ).map { |node| text_or_link node } }
    end
    
    protected
    
    def text_or_link( node )
      node.at( 'a' ).nil? ? node.text.strip : CGI.escapeHTML( node.at( 'a' )[ 'href' ] )
    end
    
  end
end