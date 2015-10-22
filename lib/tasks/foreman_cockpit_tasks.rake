# Tests
namespace :test do
  desc 'Test ForemanCockpit'
  Rake::TestTask.new(:foreman_cockpit) do |t|
    test_dir = File.join(File.dirname(__FILE__), '../..', 'test')
    t.libs << ['test', test_dir]
    t.pattern = "#{test_dir}/**/*_test.rb"
    t.verbose = true
  end
end

namespace :foreman_cockpit do
  task :rubocop do
    begin
      require 'rubocop/rake_task'
      RuboCop::RakeTask.new(:rubocop_foreman_cockpit) do |task|
        task.patterns = ["#{ForemanCockpit::Engine.root}/app/**/*.rb",
                         "#{ForemanCockpit::Engine.root}/lib/**/*.rb",
                         "#{ForemanCockpit::Engine.root}/test/**/*.rb"]
      end
    rescue
      puts 'Rubocop not loaded.'
    end

    Rake::Task['rubocop_foreman_cockpit'].invoke
  end
end

Rake::Task[:test].enhance do
  Rake::Task['test:foreman_cockpit'].invoke
end

load 'tasks/jenkins.rake'
if Rake::Task.task_defined?(:'jenkins:unit')
  Rake::Task['jenkins:unit'].enhance do
    Rake::Task['test:foreman_cockpit'].invoke
    Rake::Task['foreman_cockpit:rubocop'].invoke
  end
end
