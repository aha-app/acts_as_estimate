require 'active_support/core_ext'
require File.join(File.dirname(__FILE__), "acts_as_estimate/railtie.rb")

module ActsAsAwesome
  autoload :Hook, File.join(File.dirname(__FILE__), "acts_as_estimate/hook")
  autoload :InstanceMethods, File.join(File.dirname(__FILE__), "acts_as_estimate/instance_methods")
end