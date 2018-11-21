# frozen_string_literal: true

require 'pry-byebug'

require 'simplecov'
SimpleCov.start do
  add_filter 'spec/'

  minimum_coverage 90
end

if ENV['CODECOV_TOKEN']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'nmax' # ATTENTION: require after simplecov

RSpec.configure do |config|
  config.filter_run_including(focus: true)
  config.run_all_when_everything_filtered = true
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'
end
