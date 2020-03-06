# frozen_string_literal: true

require 'erb'
require './test/test_helper'

class TestPeople < TestRoute
    def setup
        @salesloft_controller = mock
        SalesLoftController.stubs(:instance).returns(@salesloft_controller)
    end

    def test_people_list
        @salesloft_controller.stubs(:people_available).returns(people_available)

        get 'api/v1/people'

        @users = people_available
        html_response = last_response.body
        erb = ERB.new(File.read('./app/views/people/show.html.erb')).result(binding)

        assert_equal 200, last_response.status
        assert_equal erb, html_response
    end

    private

    def people_available
        [
            { 'display_name' => 'Ernesto', 'email_address' => 'ernesto@salesloft.com', 'title' => 'Software engineer' },
            { 'display_name' => 'Ismael', 'email_address' => 'ismael@salesloft.com', 'title' => 'Software engineer' },
            { 'display_name' => 'Eddie', 'email_address' => 'eddie@salesloft.com', 'title' => 'Software recruiter' }
        ]
    end
end
