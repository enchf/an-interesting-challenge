# frozen_string_literal: true

require './test/test_helper'
require './app/controllers/salesloft_controller'

class TestSalesLoftController < Minitest::Test
    def test_people_available
        gem_namespace.expects(:configure).once
        gem_namespace::Resources::People.expects(:list).once.returns(sample_data)

        SalesLoftController.instance.people_available
    end

    private

    def gem_namespace
        ::RSalesloft
    end

    def sample_data
        {"data" => []}
    end
end
