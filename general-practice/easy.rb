# 412 Fizz Buzz
# @param {Integer} n
# @return {String[]}
# def fizz_buzz(n)
#   result = []
#   arr = [*1..n]
#   arr.each do |el|
#     if (el % 15).zero?
#       el = 'FizzBuzz'
#     elsif (el % 3).zero?
#       el = 'Fizz'
#     elsif (el % 5).zero?
#       el = 'Buzz'
#     end
#     result.push(el.to_s)
#   end
#   result
# end
# refactor
def fizz_buzz(n)
  (1..n).map do |x|
    next 'FizzBuzz' if (x % 15).zero?
    next 'Buzz' if (x % 5).zero?
    next 'Fizz' if (x % 3).zero?

    x.to_s
  end
end

# 1342. Number of Steps to Reduce a Number to Zero
# @param {Integer} num
# @return {Integer}
def number_of_steps(num)
  steps = 0
  while num.positive?
    if num.even?
      num /= 2
    elsif num.odd?
      num -= 1
    end
    steps += 1
  end
  steps
end

# 1672. Richest Customer Wealth
# @param {Integer[][]} accounts
# @return {Integer}
def maximum_wealth(accounts)
  sum = accounts.map do |account|
    account.reduce(:+)
  end
  sum.max
end
