# frozen_string_literal: true

require 'grape'
require './app/controllers/people_controller'

module SalesLoft
    class People < Grape::API
        content_type :html, 'text/html'
        formatter :html, Grape::Formatter::Erb
        format :html

        resource :people do
            desc 'Show a list of People displaying each Person’s name, email address, and job title.'
            get erb: 'people/show' do 
                @users = PeopleController.instance.people_available
            end
        end

        resource :frequency do
            desc 'Show the frequency map of all characters present in people email addresses'
            get erb: 'people/frequency' do
                @frequency_map = PeopleController.instance.emails_characters_frequency_map
            end
        end
    end
end
