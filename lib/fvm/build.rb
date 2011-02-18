require 'active_resource'

class Build < ActiveResource::Base
  self.site = 'http://fvm.heroku.com'
  # self.element_name = 'build'
  self.format = :json
  
  def self.sdk( name )
    all( :params => { :sdk => name } )
  end
  
  def self.version( name )
    all( :params => { :version => name } )
  end
end