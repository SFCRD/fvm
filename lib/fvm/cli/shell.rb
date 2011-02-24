require 'highline'
require 'active_support/ordered_hash'

module Fvm
  module CLI
    class Shell
=begin rdoc
  Chooses a build from a set of builds
=end
      def choose( builds )

        builds = ActiveSupport::OrderedHash[ builds.sort.reverse.map { |b| [ b.to_menu, b ] } ]
        
        highline.choose do |m|
          
          m.choices *builds.keys do |choice|
            
            builds[ choice ]
            
          end
        end
      end
=begin rdoc
  Outputs a list of all builds in the set
=end
      def list( builds )
        builds.sort.reverse.each do |build|
          puts build.to_menu
        end
      end
=begin rdoc
  Asks the user if they agree to the MPL terms
=end
      def mpl?
        highline.say license
        highline.agree agreement
      end
=begin rdoc
  Exit with the specified message
=end
      def exit( message )
        highline.say message
        Kernel.exit 1
      end
=begin rdoc
  Give mad props to the user
=end
      def props( message )
        highline.say "<%= color( '#{message}', GREEN, BOLD )%>"
      end
=begin rdoc
  For the time being, the user must manually re-set $FLEX_HOME. Warn them!
=end
      def warn_restart!
        highline.say "<%= color( 'You have changed the Flex SDK version. Please run `fvm-restart` to re-set $FLEX_HOME.', RED )%>"
      end

      protected
=begin rdoc
  The HighLine instance for this shell wrapper
=end
      def highline
        @highline ||= HighLine.new
      end
      
=begin rdoc
  EULA license text from the Open Source SDK download page.
=end
      def license
<<-EOS
<%= color( 'License', :bold )%>

<%= color( 'Mozilla Public License Files:', :underline ) %>

The contents of the files contained in this Flex SDK download are subject to the Mozilla Public License Version 1.1 (the "License"); you may not use these files except in compliance with the License. You may obtain a copy of the License here: <%= color( '#{license_url}', :underline ) %>

Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for the specific language governing rights and limitations under the License.

The Original Code consists of the files listed above.

The Initial Developer of the Original Code is Adobe Systems Incorporated.

By downloading, modifying, distributing, using and/or accessing any files in this Flex SDK, you agree to the terms and conditions of the applicable end user license agreement.   

EOS
      end
=begin rdoc
  URL for the mozilla MPL license
=end
      def license_url
        "http:/www.mozilla.org/MPL/"
      end
=begin rdoc
  License agreement statement
=end
      def agreement
        "I have read the License Agreement(s), and by downloading the software, I agree to the terms of the agreement (yes|no):"
      end

    end
  end
end