# frozen_string_literal: true

module Nmax
  # Extract numbers from a stream.
  #
  # Usage example:
  #   numbers = NumbersExtractor.new(
  #     source: STDIN,
  #     logger: Logger.new('log.txt')
  #   )
  #   numbers.each { |number| p number }
  #
  class NumbersExtractor
    CHARS_LIMIT = 1_000

    def initialize(source:, logger:)
      @source = source
      @logger = logger
    end

    def each(&block)
      accumulator = [] # Used array because string is immutable in new ruby

      @source.each_char do |char|
        if /\d/.match?(char)
          accumulator << char
        else
          next if accumulator.empty?

          create_number(accumulator)
          accumulator.clear # Should be before calling of a block

          handle_number(&block)
        end
      end
    end

    private

    def create_number(accumulator)
      @number_as_string = accumulator.join
      @number = @number_as_string.to_i
    end

    def handle_number
      if number_valid?
        yield @number
      else
        # TODO: Clarify how to handle invalid number
        @logger.warn("Invalid digital sequence: #{@number_as_string}")
      end
    end

    def number_valid?
      @number_as_string.size <= CHARS_LIMIT
    end
  end
end
