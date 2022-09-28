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
