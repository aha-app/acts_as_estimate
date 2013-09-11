require 'active_support/core_ext'
require File.join(File.dirname(__FILE__), "acts_as_estimate/railtie.rb")

module ActsAsEstimate
  ESTIMATE_UNITS_MINUTES = 10
  ESTIMATE_UNITS_STORY_POINTS = 20
  
  autoload :Hook, File.join(File.dirname(__FILE__), "acts_as_estimate/hook")
  autoload :InstanceMethods, File.join(File.dirname(__FILE__), "acts_as_estimate/instance_methods")
end