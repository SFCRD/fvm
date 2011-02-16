require 'bundler'
Bundler::GemHelper.install_tasks

$: << File.join( File.dirname( __FILE__ ), 'test' )

require 'open-uri'

desc "Pulls down the target Flex SDK download pages"
task :fixtures do
  [ '4', '3', 'Hero' ].each do |sdk|
    open( "http://opensource.adobe.com/wiki/display/flexsdk/Download+Flex+#{sdk}" ) do |response|
      File.open( "test/fixtures/parsers/Flex_SDK_#{sdk}.html", "w" ) do |f|
        f << response.read
      end
    end
  end
end

desc "Runs the test suite"
task :test do
  require 'test_helper'
end