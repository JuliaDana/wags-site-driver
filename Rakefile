require 'bundler'
Bundler.setup

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
rescue LoadError
  # no rspec available
  puts "RSpec tasks not available. Please install RSpec to get these tasks."
end
 
