# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'ach/version'

Gem::Specification.new do |s|
  s.name        = 'ach'
  s.version     = ACH::VERSION.dup
  s.summary     = 'Helper for building ACH files'
  s.description = 'ach is a Ruby helper for building and parsing ACH files. In particular, it helps with field order and alignment, and adds padding lines to end of file.'
  s.email       = 'jmorgan@morgancreative.net'
  s.homepage    = 'https://github.com/jm81/ach'
  s.authors     = ['Jared Morgan', 'Josh Puetz']

  s.extra_rdoc_files = ['README.md']

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if s.respond_to?(:metadata)
    if ENV['GEM_ALLOWED_PUSH_HOST'] && !ENV['GEM_ALLOWED_PUSH_HOST'].strip.empty?
      s.metadata['allowed_push_host'] = ENV['GEM_ALLOWED_PUSH_HOST']
    else
      raise 'You must set the GEM_ALLOWED_PUSH_HOST env var to the host (and optionally path) where this gem can be pushed.'
    end
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  s.files        = Dir.glob('lib/**/*') + %w{MIT-LICENSE README.md}
  s.test_files   = Dir.glob('examples/**/*')
  s.require_path = 'lib'

  s.required_ruby_version = '>= 2.6'

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', '~> 2.0')
end
