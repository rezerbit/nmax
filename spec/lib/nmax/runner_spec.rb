# frozen_string_literal: true

require 'logger'

RSpec.describe Nmax::Runner do
  let(:stream) { simulate_stdin(sequence) }
  let(:sequence) { '' }

  subject do
    described_class.new(
      numbers_extractor: Nmax::NumbersExtractor.new(
        source: stream,
        logger: Logger.new(nil)
      ),
      storage: Nmax::Storage.new
    )
  end

  before { ARGV[0] = 5 }

  describe '#initialize' do
    it 'makes instance' do
      expect(subject.n).to eq 5
      expect(subject.instance_variable_get(:@numbers_extractor)).to be_a Nmax::NumbersExtractor
      expect(subject.instance_variable_get(:@storage)).to be_a Nmax::Storage
    end

    context 'when n not specified' do
      before { ARGV[0] = nil }

      it 'returns error' do
        expect { subject }.to raise_error ArgumentError
      end
    end
  end

  describe '#call' do
    let(:sequence) { '1 2 3 4 5 6 7 8 9 10' }

    it 'puts largest numbers from the stream to stdout' do
      expect { subject.call }.to output("6\n7\n8\n9\n10\n").to_stdout
    end

    context 'when numbers form the stream non-unique' do
      let(:sequence) { '1 5 5 2 4 5 8 123 8 10' }

      it 'puts largest numbers from the stream to stdout' do
        expect { subject.call }.to output("4\n5\n8\n10\n123\n").to_stdout
      end
    end
  end
end
