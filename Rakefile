require 'rspec/core/rake_task'
require_relative './app'

RSpec::Core::RakeTask.new :test do |t|
  t.pattern = 'test/**{,/*/**}/*_spec.rb'
end

task default: [:test]

desc 'Run the app in interactive mode'
task :run do
  app = App.new
  app.run
end
