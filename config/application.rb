require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Protospace
  class Application < Rails::Application
    config.generators do |g|
        g.test_framework false
        g.helper false
        g.assets false
    end
    config.active_record.raise_in_transactional_callbacks = true
  end
end
