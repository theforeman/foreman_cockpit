$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'foreman_cockpit/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'foreman_cockpit'
  s.version     = ForemanCockpit::VERSION
  s.date        = Date.today.to_s
  s.authors     = ['Daniel Lobato']
  s.email       = ['me@daniellobato.me']
  s.homepage    = 'http://github.com/theforeman/foreman_cockpit'
  s.summary     = "See your hosts' journal and console though Cockpit."
  s.description = <<-DESCRIPTION
This plugin adds a tab to see your host's console and journal if they have
Cockpit installed.
DESCRIPTION
  s.licenses    = ['GPL-3']

  s.files = Dir['{app,config,lib,locale}/**/*', 'LICENSE', 'Rakefile',
                'README.md']
  s.test_files = Dir['test/**/*']

  s.add_development_dependency 'rubocop'
end
