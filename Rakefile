require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new(:rubocop) do |task|
  task.options = ['--force-exclusion']
end

task default: [:spec, :rubocop]

desc 'Open a REPL for experimentation'
task :repl do
  require 'pry'
  ARGV.clear
  RuboCop.pry
end
