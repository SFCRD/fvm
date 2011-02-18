module Fvm
=begin rdoc
  Contains various helpers to be used during the download confirmation process
=end
  class Confirmer
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
      "I have read the License Agreement(s), and by downloading the software, I agree to the terms of the agreement."
    end
  end
end