require 'rails'
require 'acts_as_estimate'

module ActsAsEstimate
  class Railtie < Rails::Railtie
    initializer 'acts_as_estimate.insert_into_active_record' do
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.send(:extend, ActsAsEstimate::Hook)
      end
    end
  end
end
