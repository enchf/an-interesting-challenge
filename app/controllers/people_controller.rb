# frozen_string_literal: true

require 'rsalesloft'
require 'singleton'

require './app/helpers/characters'

class PeopleController
    PEOPLE_DATA = %w[display_name email_address title].freeze

    include Singleton
    include Characters

    def initialize
        ::RSalesloft.configure(api_key: Settings.salesloft.api_key)
    end

    def people_available
        all_people_from_salesloft.map { |row| row.slice(*PEOPLE_DATA) }
    end

    def emails_characters_frequency_map
        all_salesloft_emails.map(&method(:charmap))
                            .reduce({}) { |acc, hash| acc.merge(hash) { |_, oldval, newval| oldval + newval } }
                            .sort_by { |_, v| -v }
                            .to_h
    end

    def possible_duplicate_people
        emails = all_salesloft_emails.each_with_index

        emails.map do |email, index|
            [
                email,
                emails.select { |other_email, jindex| index != jindex && string_distance(email, other_email) < 3 }
                      .map(&:first)
            ]
        end
    end

    private

    def all_salesloft_emails
        all_people_from_salesloft.map { |row| row['email_address'] }
    end

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
