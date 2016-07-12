require "bundler/gem_tasks"
require 'yard'
require "rake/testtask"

p base_path = File.expand_path('..', __FILE__)
p basename = File.basename(base_path)

desc "make documents by yard"
task :yard => [:hiki2md] do
  YARD::Rake::YardocTask.new
end

desc "transfer hikis/*.hiki to wiki"
task :hiki2md do
  files = Dir.entries('hikis')
  files.each{|file|
    name=file.split('.')
    case name[1]
    when 'hiki'
      p command="hiki2md hikis/#{name[0]}.hiki > #{basename}.wiki/#{name[0]}.md"
      system command
    when 'gif','png','pdf'
      p command="cp hikis/#{file} #{basename}.wiki/#{file}"
      system command
    end
  }
  system "cp #{basename}.wiki/README_ja.md README.md"
  system "cp #{basename}.wiki/README_ja.md #{basename}.wiki/Home.md"
  system "cp docs/*.gif #{basename}.wiki"
  system "cp docs/*.gif doc"
  system "cp docs/*.png #{basename}.wiki"
  system "cp docs/*.png doc"
end

