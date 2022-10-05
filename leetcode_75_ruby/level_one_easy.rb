#########################################
# DAY 10
#########################################
# 509. Fibonacci Number
# @param {Integer} n
# @return {Integer}
# recursive solution - easy to read but slow O(N^2)
def fib(n)
  return if n.negative?
  # base case
  return n if n.zero? || n == 1

  fib(n - 1) + fib(n - 2)
end

# non-recursive solution - faster O(n) & uses less space O(1)
def fib(n)
  return if n.negative?
  return 0 if n.zero?
  return 1 if n == 1

  # base case
  a = 0
  b = 1
  value = 0
  (2..n).each do
    value = a + b
    a = b
    b = value
  end
  value
end

#########################################
# DAY 7
#########################################
# 278 First Bad Version
# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  return n if n == 1

  lower_bound = 1
  upper_bound = n
  bad = n

  while lower_bound <= upper_bound
    midpoint = ((lower_bound + upper_bound) / 2).to_i

    if is_bad_version(midpoint)
      # search left half
      bad = [bad, midpoint].min
      upper_bound = midpoint - 1
    else
      # search right half for bad version
      lower_bound = midpoint + 1
    end
  end
  bad
end
# linear would take too long
# [*1..n].each { |ver| return ver if is_bad_version(ver) }
# one-liner with ruby method
# (1..n).bsearch { |i| is_bad_version(i) }
# recursion
# def first_bad_version(n, p = 0)
#   return n if n == p

#   t = ( p + n ) / 2
#   is_bad_version(t) ? first_bad_version(t, p) : first_bad_version(n, t + 1)
# end

#########################################
# 704 Binary Search
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  lower_bound = 0
  upper_bound = nums.length - 1
  while lower_bound <= upper_bound
    midpoint = ((lower_bound + upper_bound) / 2).to_i
    midpoint_value = nums[midpoint]
    return midpoint if midpoint_value == target

    if target < midpoint_value # only search left half
      upper_bound = midpoint - 1
    else # only search right half
      lower_bound = midpoint + 1
    end
  end
  -1
end
# linear search method
# def search(nums, target)
#   nums.each_with_index do |num, idx|
#     return idx if num == target
#   end
#   -1
# end

#########################################
# DAY 6 - PART 1
#########################################
# 589. N-ary Tree Preorder Traversal
# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root, {List}
# @return {List[int]}
# recursive
# def preorder(root, traverse = [])
#   return traverse unless root

#   traverse.push(root.val)
#   root.children.each do |child|
#     preorder(child, traverse)
#   end
#   traverse
# end
# refactor - iterative
def preorder(root)
  return [] unless root # edge-case -> no root presented

  ans = [] # what we will return (where we store the values)
  stack = [root] # we will use an Array functioning as a Stack, and add the Root to it
  while stack[0] # While there is anything in the Stack, keep looping
    current = stack.pop # pull the last node entered into the stack off and store it in the 'current' variable
    ans.push(current.val) # add the value of the Node to the final array we will return
    temp = [] # create a temporary array to store the children nodes
    current.children.each { |x| temp.unshift(x) }
    # add these children nodes to the FRONT of the temp array
    temp.each { |x| stack.push(x) } # since we stored the children nodes in reverse order, now add them to the Stack
    # keep doing this until the Stack array is empty
  end
  ans
end

#########################################
# DAY 5
#########################################
# 409 Longest Palindrome
# @param {String} s
# @return {Integer}
def longest_palindrome(str)
  return 1 if str.length == 1

  # map out number of each character
  letters = {}
  # populate hash with letter => count
  str.chars.each do |c|
    !letters[c] ? letters[c] = 1 : letters[c] += 1
  end

  result = 0
  odd = 0

  letters.each_value do |char|
    if char > 1
      if char.even?
        result += char
      else
        result += char - 1
        odd += 1
      end
    else
      odd += 1
    end
  end
  result += 1 if odd.positive?

  result
end
# refactor
# def longest_palindrome(str)
#   t = Set.new
#   ans = 0
#   str.chars.each do |c|
#     if t.include?(c)
#       t.delete(c)
#       ans += 2
#     else
#       t << c
#     end
#   end
#   ans == str.length ? ans : ans + 1
# end
# def longest_palindrome(s)
#   hist = s.chars.each_with_object({}) do |x, obj|
#     obj[x] ||= 0
#     obj[x] += 1
#   end
#   odd_flag = false
#   sum = hist.values.sum do |x|
#     odd_flag = true if odd_flag || x.odd?
#     x.odd? ? x - 1 : x
#   end
#   odd_flag ? sum + 1 : sum
# end

#########################################
# 121 Best Time to Buy and Sell Stock
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  profit = 0
  buy = prices.first
  prices.each do |price|
    buy = price if price < buy
    sell = price
    new_profit = sell - buy
    profit = new_profit if new_profit > profit
  end
  profit
end
# refactor
# def max_profit(prices)
#   return 0 if prices.empty?

#   max_profit = 0
#   min_price = prices[0]

#   prices.each do |price|
#     min_price = [min_price, price].min
#     max_profit = [max_profit, price - min_price].max
#   end

#   max_profit
# end
# def max_profit(prices)
#   buy = prices[0]
#   prof = 0
#   i = 0
#   while i < prices.size
#     if prices[i] < buy
#       buy = prices[i]
#     else
#       new_prof = prices[i] - buy
#       prof = [prof, new_prof].max
#     end
#     i += 1
#   end
#   prof
# end

#########################################
# DAY 4 - PART 1
#########################################
# 876 Middle of the Linked List
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
# def middle_node(head)
#   return head if head.next == nil

#   temp = ListNode.new(head.val)
#   array = [head.val]
#   head = head.next

#   until head.nil?
#     temp.next = ListNode.new(head.val)
#     array.push(head.val)
#     head = head.next
#   end
#   middle_index = (array.length / 2).to_i
#   array.slice(middle_index, array.length - 1)
# end
# refactor
def middle_node(head)
  slow = fast = head
  while !fast.nil? && !fast.next.nil?
    slow = slow.next # half speed of fast
    fast = fast.next.next
  end
  slow
end

#########################################
# DAY 3
#########################################
# 206 Reverse Linked List
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
# def reverse_list(head)
#   return [] unless head

#   temp = ListNode.new(head.val)
#   array = [head.val]
#   head = head.next

#   until head.nil?
#     temp.next = ListNode.new(head.val)
#     array.push(head.val)
#     head = head.next
#   end
#   array.reverse!
# end
# Refactor
def reverse_list(head)
  prev = nil
  curr = head
  until curr.nil?
    temp = curr.next
    curr.next = prev
    prev = curr
    curr = temp
  end
  prev
end

#########################################
# 21 Merge Two Sorted Lists
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  return list2 unless list1

  return list1 unless list2

  if list1.val < list2.val
    temp = head = ListNode.new(list1.val)
    list1 = list1.next
  else
    temp = head = ListNode.new(list2.val)
    list2 = list2.next
  end

  while !list1.nil? && !list2.nil?
    if list1.val < list2.val
      temp.next = ListNode.new(list1.val)
      list1 = list1.next
    else
      temp.next = ListNode.new(list2.val)
      list2 = list2.next
    end
    temp = temp.next
  end
  # Add all the nodes in list1, if remaining
  until list1.nil?
    temp.next = ListNode.new(list1.val)
    list1 = list1.next
    temp = temp.next
  end
  # Add all the nodes in l2, if remaining
  until list2.nil?
    temp.next = ListNode.new(list2.val)
    list2 = list2.next
    temp = temp.next
  end
  head
end

#########################################
# DAY 2
#########################################
# 392 Is Subsequence
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

# 205 Isomorphic Strings
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

#########################################
# DAY 1
#########################################
# 1480 Running Sum of 1d Array
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

# 724 Find Pivot Index
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
