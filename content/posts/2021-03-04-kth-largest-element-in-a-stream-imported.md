---
author: "volyx"
title:  "703. Kth Largest Element in a Stream"
date: "2021-03-04"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "heap"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![703. Kth Largest Element in a Stream](https://leetcode.com/problems/kth-largest-element-in-a-stream/)

Design a class to find the kth largest element in a stream. Note that it is the kth largest element in the sorted order, not the kth distinct element.

Implement KthLargest class:

- KthLargest(int k, int[] nums) Initializes the object with the integer k and the stream of integers nums.
- int add(int val) Returns the element representing the kth largest element in the stream.

```txt
Example 1:

Input
["KthLargest", "add", "add", "add", "add", "add"]
[[3, [4, 5, 8, 2]], [3], [5], [10], [9], [4]]
Output
[null, 4, 5, 5, 8, 8]

Explanation
KthLargest kthLargest = new KthLargest(3, [4, 5, 8, 2]);
kthLargest.add(3);   // return 4
kthLargest.add(5);   // return 5
kthLargest.add(10);  // return 5
kthLargest.add(9);   // return 8
kthLargest.add(4);   // return 8
```

Constraints:

- 1 <= k <= 104
- 0 <= nums.length <= 104
- -104 <= nums[i] <= 104
- -104 <= val <= 104
- At most 104 calls will be made to add.
- It is guaranteed that there will be at least k elements in the array when you search for the kth element.

```java
class KthLargest {
    int[] pq; // k + 1
    int n = 0;
    int k;
    public KthLargest(int k, int[] nums) {
        this.k = k;
        this.pq = new int[k + 1];
        for (int i = 0; i < nums.length; i++) {
            add(nums[i]);
        }
    }
    
    public int add(int val) {
        if (n < k) {
            pq[++n] = val;
            swim(n);
        } else {
           if (val > pq[1]) {
                pq[1] = val;
                sink(1);
            } 
        }
        return pq[1];
    }

    void swim(int k) {
        while (k > 1 && !less(k/2, k)) {
            exch(k/2, k);
            k = k / 2;
        }
    }

    void sink(int k) {
        while (2 * k < pq.length) {
            int j = 2 * k;
            if (j < pq.length - 1 && !less(j, j+ 1)) j++;

            if (less(k, j)) break;
            exch(k, j);
            k = j;
        }
    }

    int delMin() {
        int max = pq[1];   
        exch(1, n--);
        sink(1);
        pq[n+1] = -1;   
        return max;
    }

    boolean isEmpty() {
        return n == 0;   
    }

    boolean less(int i, int j) {
        return pq[i] < pq[j];
    }

    void exch(int i, int j) {
        int t = pq[i];
        pq[i] = pq[j];
        pq[j] = t;
    }

}

/**
 * Your KthLargest object will be instantiated and called as such:
 * KthLargest obj = new KthLargest(k, nums);
 * int param_1 = obj.add(val);
 */
```

## Solution 2021-11-20

```java
class KthLargest {
    
    PriorityQueue<Integer> q = new PriorityQueue<>();
    int k;

    public KthLargest(int k, int[] nums) {
        this.k = k;
        for (int num: nums) {
            add(num);
        }
    }
    
    public int add(int val) {
        q.add(val);
        if (q.size() > k) {
            q.poll();
        }
        return q.peek();
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * KthLargest obj = new KthLargest(k, nums);
 * int param_1 = obj.add(val);
 */
```

Notes:

- Ask about unique value
- Ex1: 6,5,4,2 and k = 3 will return 4
- Ex2: 6,5,5,2 and k = 3 will return 4 or 5?
