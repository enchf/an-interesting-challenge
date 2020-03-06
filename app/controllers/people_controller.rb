# frozen_string_literal: true

require 'rsalesloft'
require 'singleton'

class PeopleController
    PEOPLE_DATA = %w[display_name email_address title].freeze

    include Singleton

    def initialize
        ::RSalesloft.configure(api_key: Settings.salesloft.api_key)
    end

    def people_available
        all_people_from_salesloft.map { |row| row.slice(*PEOPLE_DATA) }
    end

    private

    def all_people_from_salesloft
        ::RSalesloft::Resources::People::list["data"]
    end
end
