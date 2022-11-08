# 1 Two Sum
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# using a hash to keep track
def two_sum(nums, target)
  numbers = {}
  nums.each_with_index do |num, i|
    diff = target - num

    return [numbers[diff], i] if numbers[diff]

    numbers[num] = i
  end
end

# naive approach, time limit exceeded
# def two_sum(nums, target)
#   return if nums.nil?

#   indices = []

#   for i in 0...nums.length
#     for j in (i + 1)...nums.length
#       if nums[i] + nums[j] == target
#         indices.push(i, j)
#         break
#       end
#     end
#   end
#   indices
# end

# 83 Remove Duplicates from Sorted List
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
def delete_duplicates(head)
  return head if head.nil? || head.next.nil?

  temp = head

  temp.val == temp.next.val ? temp.next = temp.next.next : temp = temp.next until temp.next.nil?

  head
end

# 141 Linked List Cycle
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  return false if !head || head.next.nil?

  seen_nodes = {}
  temp = head

  until temp.next.nil?
    return true if seen_nodes[temp]

    seen_nodes[temp] = true
    temp = temp.next
  end
  false
end
# refactor
def cycle?(head)
  return false if !head || head.next.nil?

  slow = head
  fast = head.next

  while fast&.next
    slow = slow.next
    fast = fast.next.next
    return true if slow == fast
  end
  false
end

# 160 Intersection of Two Linked Lists
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def get_intersection_node(head_a, head_b)
  return nil if head_a.nil? || head_b.nil?

  seen_nodes = {}

  until head_a.nil?
    seen_nodes[head_a] = head_a.val unless seen_nodes[head_a]
    head_a = head_a.next
  end
  until head_b.nil?
    return head_b if seen_nodes[head_b]

    head_b = head_b.next
  end

  nil
end

# 203 Remove Linked List Elements
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
  return nil if head.nil?

  node = head
  until node.next.nil?
    if node.next.val == val
      node.next = node.next.next
    else
      node = node.next
    end
  end
  head = head.next if head.val == val

  head
end

# 234 Palindrome Linked List
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
  data = []
  current_node = head
  until current_node.nil?
    data << current_node.val
    current_node = current_node.next
  end
  data == data.reverse
end

# using slow and fast pointers
def palindrome?(head)
  return true if head.nil?

  slow = fast = head

  # Traverse till the middle of the list using slow and fast pointer
  # When fast reaches the end, slow pointer will be at the middle of the list
  until fast&.next.nil?
    fast = fast.next.next
    slow = slow.next
  end

  # Reverse the slow pointer
  slow = reverse(slow)

  # compare slow with head val by val
  # if any one of them is not matching
  # then they aren't palindrome.
  current = head
  until slow.nil?
    return false if current.val != slow.val

    current = current.next
    slow = slow.next
  end
  true
end

# returns a reversed linkedlist.
def reverse(node)
  prev = nil

  until node.nil?
    next_node = node.next
    node.next = prev
    prev = node
    node = next_node
  end
  prev
end

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

# 599 Minimum Index Sum of Two Lists
# @param {String[]} list1
# @param {String[]} list2
# @return {String[]}
def find_restaurant(list1, list2)
  common = list1 & list2

  hash = {}

  common.each { |x| hash[x] = list1.index(x) + list2.index(x) }

  hash.select { |_, v| v == hash.values.min }.keys
end

# initial iterative approach
# time limit exceeded
def find_restaurant_iterative(list1, list2)
  result = []
  dict = {}

  list1.each_with_index do |word, i|
    list2.each_with_index do |str, j|
      if word == str
        index_sum = i + j
        dict[word] = index_sum
      end
    end
  end

  dict.each_pair { |k, v| result.push(k) if v == dict.values.min }
  result
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

# 976 Largest Perimeter Triangle
# @param {Integer[]} nums
# @return {Integer}
def largest_perimeter(nums)
  nums = nums.sort.reverse
  use_length = nums.length - 3

  for i in 0..use_length do
    if nums[i + 2] + nums[i + 1] > nums[i]
      return nums[i + 2] + nums[i + 1] + nums[i]
    end
  end

  0
end

# 1351 Count Negative Numbers in a Sorted Matrix
# @param {Integer[][]} grid
# @return {Integer}
def count_negatives(grid)
  count = 0

  grid.each do |row|
    row.each do |col|
      count += 1 if col.negative?
    end
  end

  count
end

# binary search approach
def negative_counts(grid)
  cols = grid[0].length
  count = 0

  grid.each do |rows|
    # if starting index of a row is negative
    # then entire row will be negative
    if rows[0].negative?
      count += cols
      next
    end

    # if last index of a row is positive
    # then there are no negative integers in that row
    next if (rows[cols - 1]).positive?

    left = 0
    right = cols - 1

    while left <= right
      midpoint = (left + right) / 2

      # if the number at rows[midpoint] is negative
      if rows[midpoint].negative?
        # check if midpoint itself is zero index or if the value left of midpoint is zero or positive
        if midpoint.zero? || rows[midpoint - 1] >= 0
          count += (cols - midpoint)
          break
        end

        right = midpoint - 1
      else
        left = midpoint + 1
      end
    end
  end

  count
end

# 1544 Make the string great
# @param {String} s
# @return {String}
def make_good(str)
  str = str.chars
  change = true
  while change
    change = false
    (0...str.size - 1).each do |i|
      a = str[i]
      b = str[i + 1]
      if (a != b) && (a.upcase == b || b.upcase == a)
        str = str[0...i] + str[(i + 2)..]
        change = true
        break
      end
    end
  end
  str.join
end

# 1662 Check If Two String Arrays are Equivalent
# @param {String[]} word1
# @param {String[]} word2
# @return {Boolean}
def array_strings_are_equal(word1, word2)
  word1.join == word2.join
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
