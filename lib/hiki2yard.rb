# -*- coding: utf-8 -*-
require 'optparse'
require "hiki2yard/version"
require 'hikiutils'

module Hiki2yard
  class Command
    def self.run(argv=[])
      new(argv).execute
    end

    def initialize(argv=[])
      @argv = argv
      @source_path = File.expand_path('..', __FILE__)
      @target_path = Dir.pwd
      p @base_name=File.basename(@target_path)
      p @source_path,@target_path
      @opts={}
    end

    def execute
      @argv << '--help' if @argv.size==0
      command_parser = OptionParser.new do |opt|
        opt.on('-v', 'show program Version.') { |v|
          opt.version = Hiki2yard::VERSION
          puts opt.ver
        }
        opt.on('-f','--force','force copy new Rakefile.') {
          @opts[:force]=true
        }
        opt.on('-i','--init','initialize hiki2yard directory.') { |v|
          init
          exit
        }
      end
      command_parser.banner = "Usage: hiki2yard [options] FILE"
      command_parser.parse!(@argv)
      exit
    end

    def init
      rev_rakefile
      mk_yardopts
      create_dir_if_not_exists(File.join(@target_path,'hikis'))
      create_dir_if_not_exists(File.join(@target_path,"#{@base_name}.wiki"))

      rev_gemspec
    end

    def rev_rakefile
      source=File.join(@source_path,'hiki2yard','new_rakefile')
      target=File.join(@target_path,'Rakefile')
      if @opts[:force] then
        copy_file_even_if_exists(source, target)
      else
        copy_file_if_not_exists(source, target)
      end
    end

    def mk_yardopts
      cont = "-\n**/*.md\n"
      File.write(File.join(@target_path,'.yardopts'),cont)
    end

    def create_dir_if_not_exists(data_path)
      return if File::exists?(data_path)
      FileUtils.mkdir(data_path,:verbose=>true) # :noop=>true)
    end

    def copy_file_if_not_exists(source, target)
      return if File::exists?(target)
      FileUtils.cp(source,target,:verbose=>true) # :noop=>true)
    end

    def copy_file_even_if_exists(source, target)
      FileUtils.cp(source,target,:verbose=>true) # :noop=>true)
    end

    def rev_gemspec
      cont=<<"EOS"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "hiki2md"
  spec.add_development_dependency "mathjax-yard"
EOS
      print "add follows at the tail of #{@target_path}/#{@base_name}.gemspec\n"
      print cont
    end
  end
end




