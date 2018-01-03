class MaxIntSet
  def initialize(max)
    @store = Array.new(max) {false}
  end

  def insert(num)
    validate!(num)
  end

  def remove(num)
    if is_valid?(num)
      @store[num] = false
    end
  end

  def include?(num)
    return true if @store[num] == true
    false
  end

  private

  def is_valid?(num)
    return false if num >= @store.length
    return false if num < 0
    true
  end

  def validate!(num)
    if is_valid?(num)
      @store[num] = true
    else
      raise ArgumentError.new("Out of bounds")
    end
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
