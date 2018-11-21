# frozen_string_literal: true

RSpec.describe Nmax do
  it 'has a version number' do
    expect(Nmax::VERSION).not_to be nil
  end

  describe 'Acceptance tests' do
    context 'when a small input stream' do
    end

    context 'when a large input stream' do
    end

    context 'when the N argument is invalid' do
      context 'when the argument is absent' do
      end

      context 'when the argument is zero' do
      end

      context 'when the argument is string' do
      end
    end
  end

  xdescribe 'Load test (Random generated stream)' do
    pending 'Disabled because the test takes a long time'

    context 'when the N argument is large' do
    end
  end
end
