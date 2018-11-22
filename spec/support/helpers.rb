# frozen_string_literal: true

require_relative 'sample_data_generator'

module Helpers
  def simulate_stdin(*inputs)
    io = StringIO.new
    inputs.flatten.each { |str| io.puts(str) }
    io.rewind
    io
  end

  #  Usage example:
  #    generate_sample_data
  #    File.open('sample_data.txt', 'r').each_line { |line| puts line }
  #
  def generate_sample_data(options = {})
    SampleDataGenerator.new(options).call
  end
end
