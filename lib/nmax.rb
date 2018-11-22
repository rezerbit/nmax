# frozen_string_literal: true

require 'logger'

require 'nmax/version'
require 'nmax/runner'
require 'nmax/numbers_extractor'
require 'nmax/storage'

# A script that finds n largest numbers from text stream.
module Nmax
  LOG_FILE_NAME = 'nmax_log.txt'

  def self.run
    Runner.new(
      numbers_extractor: NumbersExtractor.new(
        source: STDIN,
        logger: Logger.new(LOG_FILE_NAME)
      ),
      storage: Storage.new
    ).call
  end
end
