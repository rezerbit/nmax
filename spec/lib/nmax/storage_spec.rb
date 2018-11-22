# frozen_string_literal: true

RSpec.describe Nmax::Storage do
  subject { described_class.new([7, 2, 4]) }

  describe '#initialize' do
    context 'when an attribute absents' do
      let(:storage) { described_class.new }

      it 'creates empty sorted set' do
        expect(storage.instance_variable_get(:@set)).to be_kind_of SortedSet
        expect(storage.each.size).to be_zero
      end
    end

    context 'when the attribute exists' do
      it 'creates not empty sorted set' do
        expect(subject.instance_variable_get(:@set)).to be_kind_of SortedSet
        expect(subject.each).to contain_exactly 2, 4, 7
      end
    end
  end

  describe '#add' do
    before { subject.add(42) }

    it 'adds an element to the storage' do
      expect(subject.each).to include 42
    end
  end

  describe '#delete' do
    before { subject.delete(4) }

    it 'deletes the element from the storage' do
      expect(subject.each).to contain_exactly 2, 7
    end
  end

  describe '#include?' do
    it 'returns true if element included' do
      expect(subject.include?(4)).to be_truthy
    end

    it 'returns false if element not included' do
      expect(subject.include?(1)).to be_falsey
    end
  end

  describe '#min' do
    it 'returns a minimal element' do
      expect(subject.min).to eq 2
    end
  end

  describe '#size' do
    it 'returs amount of elements' do
      expect(subject.size).to eq 3
    end
  end

  describe '#swap_min' do
    before { subject.swap_min(3) }

    it 'replaces a minimal element' do
      expect(subject.min).to eq 3
    end
  end

  describe '#each' do
    let(:elements) { [] }
    before { subject.each { |e| elements << e } }

    it 'iterates through the set' do
      expect(elements).to contain_exactly 2, 4, 7
    end
  end
end
