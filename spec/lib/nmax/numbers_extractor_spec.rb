# frozen_string_literal: true

require 'logger'

RSpec.describe Nmax::NumbersExtractor do
  subject { described_class.new(source: stream, logger: Logger.new(log_file)) }

  let!(:stream) { simulate_stdin(sequence) }
  let(:sequence) { "qwe123\n345fdsa@$#(#*$" }
  let(:numbers) { [] }
  let(:log_file) { nil }

  describe '#initialize' do
    it 'sets a source of chars' do
      is_expected.to be_a described_class
      expect(subject.instance_variable_get(:@source)).to be stream
      expect(subject.instance_variable_get(:@logger)).to be_kind_of Logger
      expect(subject.instance_variable_get(:@digital_chars)).to be_empty
    end
  end

  describe '#each' do
    context 'when the stream contains digits' do
      before { subject.each { |n| numbers << n } }

      it 'returns numbers from the stream' do
        expect(numbers).to eq [123, 345]
      end
    end

    context 'when the stream is empty' do
      let(:sequence) { '' }

      before { subject.each { |n| numbers << n } }

      it 'returns nothing' do
        expect(numbers).to eq []
      end
    end

    context 'when the stream has invalid digital sequence' do
      let(:log_file) { 'test_log.txt' }
      let(:sequence) { '1234---12---12345678---' }

      before do
        `rm test_log.txt`
        stub_const("#{described_class}::CHARS_LIMIT", 7)
        subject.each { |n| numbers << n }
      end

      it 'returns only valid numbers' do
        expect(numbers).to eq [1234, 12]
        expect(File.read(log_file)).to include 'Invalid digital sequence: 12345678'
      end

      after { `rm test_log.txt` }
    end
  end
end
