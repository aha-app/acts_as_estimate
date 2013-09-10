# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'acts_as_estimate/version'

Gem::Specification.new do |s|

  # Description Meta...
  s.name        = 'acts_as_estimate'
  s.version     = ActsAsEstimate::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Chris Waters']
  s.email       = ['chris@aha.io']
  s.homepage    = 'http://github.com/k1w1/acts_as_estimate'
  s.summary     = %q{A gem allowing a active_record model to act_as_estimate.}
  s.description = %q{.}


  # Load Paths...
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']


  # Dependencies (installed via 'bundle install')...
  s.add_development_dependency("bundler", [">= 1.0.0"])
  s.add_development_dependency("activerecord")
  s.add_development_dependency("chronic_duration")
end
