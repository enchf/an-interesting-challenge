# frozen_string_literal: true

require 'rsalesloft'
require 'singleton'

class SalesLoftController
    include Singleton

    def initialize
        ::RSalesLoft.configure(api_key: Settings.salesloft.api_key)
    end

    def people_available
        ::RSalesLoft::Resources::People::list
    end
end
