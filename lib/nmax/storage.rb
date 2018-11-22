# frozen_string_literal: true

require 'set'

module Nmax
  # Wraps SortedSet and adds #swap_min method.
  # There is also a opportunity to make a storage using another data structure.
  # A new storage should has the same interface.
  class Storage
    def initialize(enum = nil)
      @set = SortedSet.new(enum)
    end

    def add(element)
      @set.add(element)
    end

    def delete(element)
      @set.delete(element)
    end

    def include?(element)
      @set.include?(element)
    end

    def min
      @set.min
    end

    def size
      @set.size
    end

    def swap_min(element)
      delete(min)
      add(element)
    end

    def each(&block)
      @set.each(&block)
    end
  end
end
