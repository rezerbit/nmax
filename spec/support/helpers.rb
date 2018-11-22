# frozen_string_literal: true

module Helpers
  def simulate_stdin(*inputs)
    io = StringIO.new
    inputs.flatten.each { |str| io.puts(str) }
    io.rewind
    io
  end
end
