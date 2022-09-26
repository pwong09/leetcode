# @param {String} s
# @param {String} t
# @return {Boolean}
def subsequence?(s, t)
  s_len = s.length
  t_len = t.length
  i = 0
  j = 0
  while i < s_len && j < t_len
    i += 1 if s[i] == t[j]
    j += 1
  end
  i == s_len
end

# @param {String} s
# @param {String} t
# @return {Boolean}
def isomorphic?(s, t)
  return false if s.length != t.length

  map = {}
  (0...s.length).each do |i|
    x = s[i]
    y = t[i]
    map["s #{x}"] = y unless map["s #{x}"]
    map["t #{y}"] = x unless map["t #{y}"]
    return false if y != map["s #{x}"] || x != map["t #{y}"]
  end
  true
end

# @param {Integer[]} nums
# @return {Integer[]}
def running_sum(nums)
  sum_array = []
  sum = 0
  nums.map { |x| x.reduce(0, :+) }
  nums.each do |num|
    sum += num
    sum_array.push(sum)
  end
  sum_array
end
# refactor
# total = 0
# nums.map { |number| total += number }

# @param {Integer[]} nums
# @return {Integer}
def pivot_index(nums)
  left_sum = 0
  sum = nums.reduce(:+)
  nums.each_with_index do |num, i|
    sum -= num
    return i if left_sum == sum

    left_sum += num
  end
  -1
end
