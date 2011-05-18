require 'rake'
require 'rake/testtask'

require 'bundler'
Bundler::GemHelper.install_tasks

task :default => [:test]

desc 'Run tests.'
Rake::TestTask.new('test') { |t|
  t.pattern = 'test/test_*.rb'
}
