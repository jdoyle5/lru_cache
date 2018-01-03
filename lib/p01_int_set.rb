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
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count >= num_buckets
      resize!
    end
    self[num].push(num)
    @count += 1
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

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }
    @store.flatten.each do |el|
      new_store[el % (num_buckets * 2)].push[el]
    end
    @store = new_store
  end
end
#
# arr = ResizingIntSet.new(5)
#
# arr.insert(1)
# arr.insert(2)
# arr.insert(3)
# arr.insert(4)
# arr.insert(5)
# p arr.store.flatten
#
# arr.insert(6)
#
# p arr
