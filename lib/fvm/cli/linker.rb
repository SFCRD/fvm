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
            rv = system 'sudo', 'ln', '-sf', path_to( file )
            unless rv and $? == 0
              raise <<-EOS.undent
                Could not create symlink to #{file.to_s}.
                Check that you have permissions on #{dir}.
              EOS
            end
          end
        end
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