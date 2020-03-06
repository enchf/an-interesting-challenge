# frozen_string_literal: true

require './test/test_helper'
require './app/controllers/people_controller'

class TestPeopleController < Minitest::Test
    def test_people_available
        gem_namespace.expects(:configure).once
        gem_namespace::Resources::People.expects(:list).once.returns(sample_data)

        PeopleController.instance.people_available
    end

    private

    def gem_namespace
        ::RSalesloft
    end

    def sample_data
        {"data" => []}
    end
end
