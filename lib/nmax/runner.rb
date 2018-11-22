# frozen_string_literal: true

module Nmax
  # Provides the main entry point to run the script.
  #
  # Usage example:
  #    Runner.new(
  #       numbers_extractor: NumbersExtractor.new(
  #         source: STDIN,
  #         logger: Logger.new('log.txt')
  #       ),
  #       storage: Storage.new
  #    ).call
  #
  class Runner
    attr_reader :n

    def initialize(numbers_extractor:, storage:)
      @n = ARGV[0].to_i
      raise ArgumentError, 'Quantity (n) must be greater than zero' unless @n.positive?

      @numbers_extractor = numbers_extractor
      @storage = storage
    end

    def call
      fill_storage
      accumulate_largest_numbers
      print_largest_numbers
    end

    private

    def fill_storage
      @numbers_extractor.each do |number|
        @storage.add(number)
        break if @storage.size == @n
      end
    end

    def accumulate_largest_numbers
      @numbers_extractor.each do |number|
        @storage.swap_min(number) if swap_min?(number)
      end
    end

    def print_largest_numbers
      @storage.each { |number| p number }
    end

    def swap_min?(number)
      !@storage.include?(number) && number > @storage.min
    end
  end
end
