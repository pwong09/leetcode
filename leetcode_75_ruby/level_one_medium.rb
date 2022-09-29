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
