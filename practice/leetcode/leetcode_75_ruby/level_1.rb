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
