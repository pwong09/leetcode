# Linked List

### Main Points
- Store and manage data in a linear collection of elements
- Linked by Nodes
- Singly linked lists have a starting point - head node

#### Node
- Two components: (1) data and (2) pointer
- Can store all kinds of data - Integer, Hash, Table, Class instance, etc.

<br>

### Performance
- Can be reorganized, merged, or insert new nodes in O(1) time complexity (compared to O(n) time with Arrays)

<br>

### Learning Sources
[Implement a Linked List in Ruby - Medium](https://medium.com/analytics-vidhya/implement-a-linked-list-in-ruby-2aae925acd9c)


<br>

### Example Node Implementation
```
class Node
    
    attr_accessor :data, :next

    def initialize(data, next_node = nil)
        @data = data
        @next = next_node
    end
end
```
[Linked List Implementation - GitHub](https://gist.github.com/wyy1234567/271c053ee5f01bd3b317bca668c81fec)
