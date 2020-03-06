# frozen_string_literal: true

require './app/routes/api.rb'

use Rack::Config do |env|
    env['api.tilt.root'] = './app/views'
end

run ::SalesLoft::API
