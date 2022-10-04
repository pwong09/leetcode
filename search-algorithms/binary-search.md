# Binary Search

### Main Points
- Used for sorted lists
- Searches by repeatedly dividing the search interval in half
- Linear search has O(n), Binary search has O(log n)
- Avoid looking at every single element
- Can be implemented iteratively or recursiving (affects space complexity)  
<br>

### Time complexity
After each comparison, input size is cut in half. 
1. Initially, input = n (n is an array)
2. After one comparison, input = n/2 (half of the original array)
3. After two comparisons, input = n/4
etc, etc, etc.  

The worst case scenario is when we reach base case - unsuccessful search - the target value isn't in input, n.
- A comparison has constant complexity O(1)
- Reaching base case takes O(log2n)

```
Worst Case = O(log2n) * O(1) = O(logn)
```
Calculate Big O by removing constants  
<br>

### Space complexity  
- dependent on implementation

**Iterative Approach** uses constant extra space.  
**Recursive Method** would depend on the size of the call stack.  

<br>

### Critical Thinking Points
- Linear search is faster for small list sizes (what is the break point to switch?)
- Insertion & Deletion takes O(n) time, and may be incompatible with a Binary Search


<br>

***
### Learning Sources
[Binary Search! - Medium](https://medium.com/@isriramdesai/binary-search-495130dfead5)  
[Binary Search - Geeks for Geeks](https://www.geeksforgeeks.org/binary-search/)  
[Binary Search Algorithm - Enjoy Algorithms](https://www.enjoyalgorithms.com/blog/binary-search-algorithm)  
