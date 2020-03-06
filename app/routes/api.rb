# frozen_string_literal: true

require 'grape'
require 'grape-erb'
require 'tilt'

require './app/config/config_loader'

require_relative 'people'

module SalesLoft
    class API < Grape::API
        version 'v1', using: :path
        prefix :api
        format :json

        configure do
            ConfigLoader.instance.load_config!
        end

        mount People

        resource :health do
            desc 'Checks application health'
            get { 'Up and running!' }
        end
    end
end
