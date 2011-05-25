# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pipette/version', __FILE__)

Gem::Specification.new do |s|
  s.add_development_dependency "bundler", "~> 1.0"
  s.add_development_dependency "rdoc", "~> 2.5"
  s.add_development_dependency "rspec", "~> 2.3"
  s.add_development_dependency "thor", "~> 0.14.6"
  s.authors = ['Jim Vallandingham']
  s.description = %q{Pipeline framework built on Thor and meant for NGS genomic data manipulation}
  s.email = 'none@none.com'
  s.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  s.extra_rdoc_files = ['LICENSE', 'README.md']
  s.files = `git ls-files`.split("\n")
  s.homepage = 'http://github.com/vlandham/pipette'
  s.name = 'pipette'
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']
  s.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')
  s.summary = s.description
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = Pipette::VERSION.dup
end

