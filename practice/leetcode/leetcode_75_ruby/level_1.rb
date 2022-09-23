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
