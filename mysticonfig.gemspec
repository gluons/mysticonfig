lib = File.expand_path('./lib', File.dirname(__FILE__))

$LOAD_PATH.push lib unless $LOAD_PATH.include?(lib)

require 'mysticonfig/version'

DESCRIPTION = 'The configuration loader to load rc config file.'.freeze

Gem::Specification.new do |s|
  s.name = 'mysticonfig'
  s.version = Mysticonfig::VERSION
  s.summary = 'The configuration loader for wizard.'
  s.description = DESCRIPTION
  s.files = ['mysticonfig.gemspec', 'LICENSE', 'Gemfile']
  s.files += Dir['*.md', 'lib/**/*']
  s.required_ruby_version = '>= 2.1.0'
  s.author = 'Saran Tanpituckpong'
  s.license = 'MIT'
  s.homepage = 'https://github.com/gluons/mysticonfig'
  s.metadata = {
    'bug_tracker_uri' => 'https://github.com/gluons/mysticonfig/issues'
  }

  s.add_runtime_dependency 'json', '~> 2.1'

  s.add_development_dependency 'rake', '~> 12.3'
  s.add_development_dependency 'rspec', '~> 3.7'
  s.add_development_dependency 'rubocop', '~> 0.52.1'
end
