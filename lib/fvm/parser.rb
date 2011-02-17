require 'nokogiri'

module Fvm
  class Parser
    
    HEADER_XPATH = '//h3'
    
    TABLE_XPATH = '//div[@class="table-wrap"]'
    
    def parse( page )
      { }.tap do |result|
        sections_for( page ).each do |title, table|
          result[ format.title title ] = format.table table
        end
      end
    end
    
    protected
    
    def format
      @format ||= Manipulator.new
    end
    
    def sections_for( page )
      titles_for( page ).zip( tables_for( page ) )
    end

    def titles_for( page )
      page.xpath( HEADER_XPATH )
    end
    
    def tables_for( page )
      page.xpath( TABLE_XPATH )
    end
    
  end
end