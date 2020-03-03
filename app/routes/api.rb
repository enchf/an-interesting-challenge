# frozen_string_literal: true

require 'grape'

require_relative 'people'

module SalesLoft
    class API < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api

        mount People

        resource :health do
            desc 'Checks application health'
            get { 'Up and running!' }
        end
    end
end
