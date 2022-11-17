# 92 Reverse Linked List II
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} left
# @param {Integer} right
# @return {ListNode}
def reverse_between(head, m, n)
  if m == 1
    reverse(head, n - m + 1)
  else
    p = head
    (m - 2).times { p = p.next }
    p.next = reverse(p.next, n - m + 1)
    head
  end
end

def reverse(head, c)
  prev = head
  c.times { prev = prev.next }
  current = head
  c.times do
    temp = current.next
    current.next = prev
    prev = current
    current = temp
  end
  prev
end

# 433 Minimum Genetic Mutation
# @param {String} start
# @param {String} end
# @param {String[]} bank
# @return {Integer}
def min_mutation(start, last, bank)
  return -1 if bank.empty?

  @dict = Hash.new { |h, k| h[k] = [] }
  q = [[start, 0]]
  visited = []

  bank.each { |gene| transform(gene) }

  l = until q.empty?
        gene, level = q.shift
        next if visited.include?(gene)
        return level if gene == last

        visited << gene
        steps = transform(gene)

        neighbours = steps.map { |step| @dict[step] }.compact.flatten
        neighbours.each { |n| q << [n, level + 1] }
      end

  l || -1
end

def transform(gene)
  res = []
  i = 0

  while i < gene.size
    new_gene = gene.dup
    new_gene[i] = '*'
    @dict[new_gene] << gene
    res << new_gene
    i += 1
  end

  res
end

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
  g = g.each_with_object({}) do |elem, hash|
    hash[elem.to_s] = 0
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

    string_arr.push(val_string) if head.next.nil? && !val_string.empty?

    head = head.next
  end

  string_arr.length
end
