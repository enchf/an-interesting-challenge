# frozen_string_literal: true

require 'grape'
require './app/controllers/salesloft_controller'

module SalesLoft
    class People < Grape::API
        content_type :html, 'text/html'
        formatter :html, Grape::Formatter::Erb
        format :html

        resource :people do
            desc 'Show a list of People displaying each Person’s name, email address, and job title.'
            get erb: 'people/show' do 
                @users = SalesLoftController.instance.people_available
            end
        end
    end
end
