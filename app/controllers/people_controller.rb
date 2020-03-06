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

    def emails_characters_frequency_map
        all_people_from_salesloft.map { |row| row['email_address'] }
                                 .map { |email| email.split('').group_by(&:itself).transform_values(&:size) }
                                 .reduce({}) { |acc, hash| acc.merge(hash) { |_, oldval, newval| oldval + newval } }
                                 .sort_by { |_, v| -v }
                                 .to_h
    end

    private

    def all_people_from_salesloft
        page = 1
        [].tap do |list|
            loop do
                response = ::RSalesloft::Resources::People::list(include_paging_counts: true, page: page)
                page += 1
                list.concat(response['data'])

                paging = response['metadata']['paging']
                break if paging['current_page'] == paging['total_pages']
            end
        end
    end
end
