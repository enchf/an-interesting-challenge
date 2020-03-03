# frozen_string_literal: true

require './test/test_helper'
require './app/config/config_loader'

class TestConfig < Minitest::Test
    def test_load_config
        ConfigLoader.instance.load_config!

        assert Settings
        assert_respond_to Settings, :salesloft
        assert_respond_to Settings.salesloft, :api_key
        assert Settings.salesloft.api_key.start_with?('v2_ak_')
    end
end
