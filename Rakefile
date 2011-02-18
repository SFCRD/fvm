require 'bundler'
Bundler::GemHelper.install_tasks

$: << File.join( File.dirname( __FILE__ ), 'test' )

require 'open-uri'

namespace :fixtures do
  
  desc "Pulls down the target Flex SDK download pages"
  task :parser do
    [ '4', '3', 'Hero' ].each do |sdk|
      open( "http://opensource.adobe.com/wiki/display/flexsdk/Download+Flex+#{sdk}" ) do |response|
        File.open( "test/fixtures/parser/Flex_SDK_#{sdk}.html", "w" ) do |f|
          f << response.read
        end
      end
    end
  end
  
  desc "Pulls down an example license confirmation page"
  task :confirmer do
    open( 'http://opensource.adobe.com/wiki/display/flexsdk/download?build=4.1.0.16076&pkgtype=2&release=4' ) do |response|
      File.open( "test/fixtures/confirmer/Confirmation.html", 'w' ) do |f|
        f << response.read
      end
    end
  end
  
  desc "Pulls down all fixture pages"
  task :all => [ :parser, :confirmer ]
end



desc "Runs the test suite"
task :test do
  require 'test_helper'
end