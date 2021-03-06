require 'active_resource'
require 'versionomy'

module Fvm
  module CLI
    class Build < ActiveResource::Base
      
      include Comparable
      
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
      
      def active?
        Fvm::System.active?( self )
      end
      
      def to_menu
        out = [ version, milestone ]
        out.unshift '*' if active?
        out.join ' '
      end
      
      def <=>( other )
        Versionomy.parse( version ) <=> Versionomy.parse( other.version )
      end
      
    end
  end
end