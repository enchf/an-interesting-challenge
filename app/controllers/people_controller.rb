# frozen_string_literal: true

require 'singleton'

class PeopleController
    include Singleton

    def all
        [
            { name: 'Ernesto', email: 'ernesto@salesloft.com', job_title: 'Software engineer' },
            { name: 'Ismael', email: 'ismael@salesloft.com', job_title: 'Software engineer' },
            { name: 'Eddie', email: 'eddie@salesloft.com', job_title: 'Software recruiter' }
        ]
    end
end
