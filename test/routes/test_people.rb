# frozen_string_literal: true

require './test/test_helper'

class TestPeople < TestRoute
    def test_people_list
        get 'api/v1/people'

        response = JSON.parse(last_response.body)
        refute response.empty?
    end
end
