# frozen_string_literal: true

class SampleDataGenerator
  DEFAULT_BYTES_COUNT = 1_000
  DEFAULT_FILE_PATH = 'sample_data.txt'
  SAMPLE_CHARS = [*('a'..'z'), *('A'..'Z'), *('0'..'9'), "\n", '!', '@', '#', '%', '$', '&'].freeze

  def initialize(options = {})
    @bytes_count = options.fetch(:bytes_count, DEFAULT_BYTES_COUNT)
    @file_path = options.fetch(:file_path, DEFAULT_FILE_PATH)
  end

  def call
    File.open(@file_path, 'w') do |f|
      @bytes_count.times do
        f.write(random_char)
        yield(random_char) if block_given? # Callback for printing to stdout
      end
    end
  end

  private

  def random_char
    SAMPLE_CHARS.sample(1).join
  end
end
