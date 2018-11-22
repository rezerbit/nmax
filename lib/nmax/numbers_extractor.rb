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
      @digital_chars = [] # Used array because string immutable in new ruby
    end

    def each(&block)
      @source.each_char do |char|
        if /\d/.match?(char)
          @digital_chars << char
        else
          next if @digital_chars.empty?

          handle_digital_chars(&block)
          @digital_chars.clear
        end
      end
    end

    private

    def handle_digital_chars
      if digital_chars_valid?
        yield digital_sequence
      else
        # TODO: Clarify how to handle invalid digital sequence
        @logger.warn("Invalid digital sequence: #{@digital_chars.join}")
      end
    end

    def digital_chars_valid?
      @digital_chars.size <= CHARS_LIMIT
    end

    def digital_sequence
      @digital_chars.join.to_i
    end
  end
end
