# frozen_string_literal: true

require './test/test_helper'

class TestHealth < TestRoute
    def test_health
        get 'api/v1/health'

        response = JSON.parse(last_response.body)
        assert_equal 'Up and running!', response
    end
end
