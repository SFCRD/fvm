require 'active_resource'

class Build < ActiveResource::Base
  self.site = 'http://fvm.heroku.com'
  self.format = :json
  
  def self.sdk( name )
    all( :params => { :sdk => name } )
  end
  
  def self.version( name )
    all( :params => { :version => name } )
  end
  
  def zip_url
    "http://fpdownload.adobe.com/pub/flex/sdk/builds/flex#{sdk.to_s.downcase}/flex_sdk_#{version}_mpl.zip"
  end
end