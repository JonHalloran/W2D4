require 'byebug'

def first_anagram?(str1, str2)
  perms = str_perm(str1)

  perms.include?(str2)

end
#Time Complexity == O(n!)
#Space Complexity = O(n!)

def str_perm(str)
  return [str] if str.length == 1
  previous = str_perm(str[0..-2])
  result = []

  previous.each do |el|
    idx = 0
    while idx <= el.length
      duped = el.dup
      # debugger
      result << duped.insert(idx, str[-1])
      idx += 1
    end
  end

  result
end

# p str_perm("abc")
# p str_perm("gizmo").length
# p str_perm("elvis").length
# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")

def second_anagram?(str1, str2)
  # debugger
  # until str1.empty? || str2.empty?
  #   matched = true
  #   while matched
  #     char1 = str1[0]
  #     matched = false
  #     str2.each_char.with_index do |char2, idx|
  #       if char1 == char2
  #         str1.slice!(0)
  #         str2.slice!(idx)
  #         matched = true
  #         next
  #       end
  #     end
  #   end
  #   return false unless matched
  # end
  until str1.empty? || str2.empty?
    char = str1[0]
    return false unless str2.delete!(char)
    str1.delete!(char)
  end
  str1 == str2
end

def thrid_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char { |char| hash1[char] += 1 }
  str2.each_char { |char| hash2[char] += 1 }

  hash1.all? { |k, v| v == hash2[k] }
end 

def fourth_anagram?(str1, str2)
  hash = Hash.new(0)

  str1.each_char { |char| hash[char] += 1 }
  str2.each_char { |char| hash[char] -= 1 }

  hash.all? { |k, v| v == 0 }
end

p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")
