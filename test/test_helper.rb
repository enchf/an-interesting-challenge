# frozen_string_literal: true

require 'simplecov'

SimpleCov.start

require 'colorize'
require 'json'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/unit'
require 'mocha/minitest'
require 'rack/test'
require 'webmock/minitest'

require './app/routes/api'

Minitest::Reporters.use!

class TestRoute < Minitest::Test
    include Rack::Test::Methods

    def app
        SalesLoft::API
    end
end
