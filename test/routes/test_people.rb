# frozen_string_literal: true

require './test/test_helper'

class TestPeople < TestRoute
    def setup
        @salesloft_controller = mock
        SalesLoftController.stubs(:instance).returns(@salesloft_controller)
    end

    def test_people_list
        @salesloft_controller.stubs(:people_available).returns(people_available)

        get 'api/v1/people'

        response = JSON.parse(last_response.body)
        assert_equal people_available, response.map { |row| row.transform_keys(&:to_sym) }
    end

    private

    def people_available
        [
            { name: 'Ernesto', email: 'ernesto@salesloft.com', job_title: 'Software engineer' },
            { name: 'Ismael', email: 'ismael@salesloft.com', job_title: 'Software engineer' },
            { name: 'Eddie', email: 'eddie@salesloft.com', job_title: 'Software recruiter' }
        ]
    end
end
