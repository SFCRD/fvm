require 'pathname'

module Fvm
  module CLI
    class Linker
      
      attr_reader :dir, :executables
      def initialize( dir, executables )
        @dir = Pathname.new( dir ).expand_path
        @executables = executables
      end
      
      def files( src )
        Dir[ File.join( src, '*' ) ].select { |name| executables.include? File.basename( name ) }
      end
      
      def link( src )
        files( src ).each do |file|
          Dir.chdir dir do
            # thanks, homebrew!
            rv = system 'ln', '-sf', file
            unless rv and $? == 0
              raise <<-EOS.undent
                Could not create symlink to #{file.to_s}.
                Check that you have permissions on #{dir}.
              EOS
            end
          end
        end
        # restart fvm to reset $FLEX_HOME
        file = Pathname.new( __FILE__ )
        puts file.inspect
        targ = file.join( '..', '..', '..', '..', 'scripts', 'wrap' )
        puts targ.inspect
        puts targ.exist?
        puts `source "#{targ.to_s}"`
      end
      
      def unlink!
        files( dir ).each { |file| File.delete file }
      end
      
      protected
      
      def path_to( file )
        Pathname.new( file ).relative_path_from( Pathname.new( dir ) )
      end
      
    end
  end
end