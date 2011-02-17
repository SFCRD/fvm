require 'nokogiri'

module Fvm
=begin rdoc
  Provides methods for parsing a Flex SDK download page into usable data structures.
  At the moment, Flex SDK download pages list all table headers and bodies in-line
  as siblings so there is no association between a given table's header and body
  except that they are in-order. For the time being, this parser rests on 
  this assumption.
=end
  class Parser
=begin rdoc
  The xpath for table headers
=end
    HEADER_XPATH = '//h3'
=begin rdoc
  The xpath for table bodies
=end
    TABLE_XPATH = '//div[@class="table-wrap"]'
=begin rdoc
  Parses a Flex SDK download page into a hash
=end
    def parse( page )
      { }.tap do |result|
        sections_for( page ).each do |title, table|
          result[ format.title title ] = format.table table
        end
      end
    end
    
    protected
=begin rdoc
  The manipulator for this parser
=end
    def format
      @format ||= Manipulator.new
    end
=begin rdoc
  Zips up table titles with their tables
=end
    def sections_for( page )
      titles_for( page ).zip( tables_for( page ) )
    end
=begin rdoc
  Finds all table titles in order
=end
    def titles_for( page )
      page.xpath( HEADER_XPATH )
    end
=begin rdoc
  Finds all tables in order
=end
    def tables_for( page )
      page.xpath( TABLE_XPATH )
    end
  end
end