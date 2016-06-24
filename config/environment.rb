# Load the Rails application.
require File.expand_path('../application', __FILE__)

ENV['RAILS_ENV'] ||= 'production'

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

# Initialize the Rails application.
Rails.application.initialize!
