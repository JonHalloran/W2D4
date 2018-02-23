require "byebug"


def my_min (array)
  greatest_diff = 0
  lowest_idx = nil
  array.each_index do |idx1|
    array.each_index do |idx2|
      next if idx1 == idx2
      current_diff = array[idx1] - array[idx2]
      if current_diff > greatest_diff
        greatest_diff = current_diff
        lowest_idx = idx2
      end
    end
  end

  array[lowest_idx]
end

#Time Complexity == O(n^2)
#Space COmplexity == O(n)

def my_min2(array)
  lowest_val = Float::INFINITY
  array.each do |el|
    lowest_val = el if el < lowest_val
  end

  lowest_val
end


# p my_min2([ 0, 3, 5, 4, -5, 10, 1, 90 ])
#Time Complexity == O(n)
#Space COmplexity == O(n)


def contig_sum(array)
  greatest_diff = -Float::INFINITY
  subsets = []

  i = 0
  while i < array.length
    j = i + 1
    while j <= array.length
      subsets << array[i..j]
      j += 1
    end
    i += 1
  end

  subsets.each do |arr|
    sum = arr.inject(:+)
    if sum > greatest_diff
      greatest_diff = sum
    end
  end
  greatest_diff

end

list = [5, 3, -7]

# p contig_sum(list)
#Time Complexity == O(n^2)
#SPace Complexity == O(2^n)

def contig_sum2(array)
  greatest_sum = array[0]
  useful_sum = array[0]

  array.each_index do |idx|
    useful_sum = 0 if useful_sum < 0 && idx == 0
    next if idx == 0
    useful_sum += array[idx]

    if useful_sum > greatest_sum
      greatest_sum = useful_sum
    elsif useful_sum < 0
      useful_sum = 0
    end
  end

  greatest_sum
end

list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
list4  = [*-5..5]
p list4.shuffle!
p contig_sum2(list4)

p "------------"
list4  = [*-5..5]
p list4.shuffle!
p contig_sum2(list4)
p "------------"
list4  = [*-5..5]
p list4.shuffle!
p contig_sum2(list4)
#
# p contig_sum2(list)
# p contig_sum2(list2)
p contig_sum2(list3)
# p contig_sum2(list4)
