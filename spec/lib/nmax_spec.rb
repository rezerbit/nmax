# frozen_string_literal: true

RSpec.describe Nmax do
  it 'has a version number' do
    expect(Nmax::VERSION).not_to be nil
  end

  describe 'Acceptance tests' do
    context 'when a small input stream' do
      it do
        expect(`cat spec/fixtures/small_sample_data.txt | nmax 5`).to eq "91\n186\n613\n748\n856\n"
      end
    end

    context 'when a large input stream' do
      it do
        expect(`cat spec/fixtures/large_sample_data.txt | nmax 5`).to eq "20376\n63555\n70121\n93143\n943575\n"
      end
    end
  end

  # Generate 'sample_data.txt' file into project root before load testing.
  # Run in terminal:
  #   $ generate_sample 4294967296
  #
  # 1024 x 1024 X 1024 x 40 = 40 GB = 4294967296 B
  describe 'Load test (Random generated stream)' do
    it do
      pending 'Disabled because the test takes a long time'
      expect(`cat sample_data.txt | nmax 5`.split("\n").size).to eq 5
    end

    context 'when the N argument is large' do
      it do
        pending 'Disabled because the test takes a long time'
        expect(`cat sample_data.txt | nmax 100_000`.split("\n").size).to eq 100_000
      end
    end
  end
end
