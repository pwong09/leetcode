# 817. Linked List Components
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer[]} nums
# @return {Integer}
def num_components(head, g)
  g = g.reduce({}) do |hash, elem|
    hash[elem.to_s] = 0
    hash
  end
  val_string = ''
  string_arr = []

  until head.nil?
    if g[head.val.to_s] == 0
      val_string += head.val.to_s
    else
      unless val_string.empty?
        string_arr.push(val_string)
        val_string = ''
      end
    end

    if head.next.nil?
      string_arr.push(val_string) unless val_string.empty?
    end

    head = head.next
  end

  string_arr.length
end