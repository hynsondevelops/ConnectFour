# This Rakefile has all the right settings to run the tests inside each lab

require 'rspec/core/rake_task'

task :default => :spec

desc "run tests for this lab"
RSpec::Core::RakeTask.new do |task|
  file = "#{Rake.application.original_dir}/lib/"
  file += ARGV.last
  task.pattern = "spec/#{ARGV.last}_spec.rb"
  task.verbose = false
end