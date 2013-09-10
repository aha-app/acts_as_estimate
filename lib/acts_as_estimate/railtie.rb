require 'rails'
require 'acts_as_estimate'

module ActsAsAwesome
  class Railtie < Rails::Railtie
    config.to_prepare do
      ApplicationController.send(:extend, ActsAsEstimate::Hook)
    end
  end
end
