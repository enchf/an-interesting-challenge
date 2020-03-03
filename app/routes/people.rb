# frozen_string_literal: true

require 'grape'
require './app/controllers/salesloft_controller'

module SalesLoft
    class People < Grape::API
        resource :people do
            desc 'Show a list of People displaying each Person’s name, email address, and job title.'
            get { SalesLoftController.instance.people_available }
        end
    end
end
