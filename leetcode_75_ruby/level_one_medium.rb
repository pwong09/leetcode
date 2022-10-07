# 62 Unique Paths
# @param {Integer} m
# @param {Integer} n
# @return {Integer}


# brute force approach - times out
# def unique_paths(m, n)
#   backtrack(0, 0, m, n)
# end

# def backtrack(r, c, m, n)
#   return 1 if r == m - 1 && c == n - 1

#   return 0 if r >= m || c >= n

#   backtrack(r + 1, c, m, n) + backtrack(r, c + 1, m, n)
# end

#########################################
# DAY 9 - Part 2
#########################################
# 200 Number of Islands
# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  number_of_islands = 0
  rows = grid.length - 1
  cols = grid[0].length - 1

  grid.each_with_index do |row, row_index|
    row.each_with_index do |col, col_index|
      if col == '1'
        number_of_islands += 1
        depth_first_search(grid, rows, cols, row_index, col_index)
      end
    end
  end

  number_of_islands
end

def depth_first_search(grid, rows, cols, row_index, col_index)
  return if row_index > rows || col_index > cols || row_index.negative? || col_index.negative?

  node = grid[row_index][col_index]

  return if node == '0'

  grid[row_index][col_index] = '0'

  # look up
  depth_first_search(grid, rows, cols, row_index - 1, col_index)
  # look down
  depth_first_search(grid, rows, cols, row_index + 1, col_index)
  # look right
  depth_first_search(grid, rows, cols, row_index, col_index + 1)
  # look left
  depth_first_search(grid, rows, cols, row_index, col_index - 1)
end
#########################################
# DAY 8
#########################################
# 235. Lowest Common Ancestor of a Binary Search Tree
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  return if root.nil?
  return root if root == p || root == q

  l_node = lowest_common_ancestor(root.left, p, q)
  r_node = lowest_common_ancestor(root.right, p, q)

  return root if !l_node.nil? && !r_node.nil?

  !l_node.nil? ? l_node : r_node
end
# 98 Validate Binary Search Tree
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  @results = []

  def traverse(tree)
    return nil unless tree

    traverse(tree.left) if tree.left
    @results.push(tree.val) unless tree.val.nil?
    traverse(tree.right) if tree.right
  end

  traverse(root)

  @results.each_with_index { |x, i| return false if @results[i + 1] && x >= @results[i + 1] }

  true
end

#########################################
# DAY 6 - PART 2
#########################################
# 102 Binary Tree Level Order Traversal
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  result = []
  return result if root.nil?

  queue = []
  queue << root # put root into queue

  until queue.empty?
    level_size = queue.length
    level = []
    level_size.times do
      node = queue.shift # remove first element in the queue
      level << node.val # add element value to level
      queue << node.left unless node.left.nil? # add next level node(s) to queue
      queue << node.right unless node.right.nil?
    end
    result << level
  end

  result
end
# recursive approach
# def level_order(root, result = [], level = 0)
#   return result unless root

#   result << [] if result.length == level # start an empty array to store values
#   result[level] << root.val
#   level_order(root.left, result, level + 1)
#   level_order(root.right, result, level + 1)
# end

# def level_order(root)
#   return [] if root.nil?

#   result = []
#   level_array = []
#   queue = [root]
#   i1 = 1
#   i2 = 0

#   while item = queue.shift
#     i1 -= 1

#     level_array << item.val

#     if item.left
#       queue << item.left
#       i2 += 1
#     end

#     if item.right
#       queue << item.right
#       i2 += 1
#     end

#     if i1.zero?
#       result << level_array
#       level_array = []
#       i1 = i2
#       i2 = 0
#     end
#   end

#   result
# end

#########################################
# DAY 4 - PART 2
#########################################
# 142 Linked List Cycle II
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
# def detect_cycle(head)
#   return nil if head.nil?

#   seen_nodes = {}
#   until head.next.nil?
#     if !seen_nodes[head.to_s]
#       seen_nodes[head.to_s] = true
#     else
#       seen_nodes['connector'] = head
#       break
#     end
#     head = head.next
#   end
#   seen_nodes['connector']
# end
# refactor, no hash map
def detect_cycle(head)
  new_head = head
  until new_head.nil?
    if new_head.val.nil?
      return new_head
    else
      new_head.val = nil
      new_head = new_head.next
    end
  end
  nil
end
