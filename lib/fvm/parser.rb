require 'nokogiri'

module Fvm
  class Parser
    
    HEADER_XPATH = '//h3'
    
    TABLE_XPATH = '//div[@class="table-wrap"]'
    
    def parse( page )
      { }.tap do |result|
        
        sections_for( page ).each do |section|
          
          result[ section.first ] = parse_table( section.last )
          
        end
        
      end
    end
    
    protected
    
    def parse_table( table )
      
      table.at( 'table/tbody' ).tap do |rows|
        headers = rows.xpath( 'tr[th]' ).xpath( 'th' )
      end
      # rows = header.next_element.at( 'table/tbody' )
      # head = rows.xpath( 'tr[th]' ).xpath( 'th' ).map( &:text ).map( &:strip )
      # blds = rows.xpath( "tr[td]" ).map { |row| Hash[ head.zip( row.xpath( 'td' ).map( &:text ).map( &:strip ) ) ] }
      # 
      # sets << { :name => name, :builds => blds }
      
    end
    
    def sections_for( page )
      titles_for( page ).zip( tables_for( page ) )
    end
    
    def titles_for( page )
      page.xpath( HEADER_XPATH ).map( &:text ).map( &:strip )
    end
    
    def tables_for( page )
      page.xpath( TABLE_XPATH )
    end
    
  end
end