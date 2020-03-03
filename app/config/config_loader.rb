# frozen_string_literal: true

require 'config'
require 'singleton'

class ConfigLoader
    include Singleton

    def load_config!
        Config.load_and_set_settings('./app/config/config.yaml')
    end
end
