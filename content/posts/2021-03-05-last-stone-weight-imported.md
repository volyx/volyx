---
author: "volyx"
title:  "1046. Last Stone Weight"
date: "2021-03-05"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "heap"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/last-stone-weight/]

We have a collection of stones, each stone has a positive integer weight.

Each turn, we choose the two heaviest stones and smash them together.  Suppose the stones have weights x and y with x <= y.  The result of this smash is:

- If x == y, both stones are totally destroyed;
- If x != y, the stone of weight x is totally destroyed, and the stone of weight y has new weight y-x.

At the end, there is at most 1 stone left.  Return the weight of this stone (or 0 if there are no stones left.)

```txt
Example 1:

Input: [2,7,4,1,8,1]
Output: 1
Explanation: 
We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,
we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,
we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,
we combine 1 and 1 to get 0 so the array converts to [1] then that's the value of last stone.
```

Note:

- 1 <= stones.length <= 30
- 1 <= stones[i] <= 1000

```java
class Solution {
    int[] heap;
    int n;
    public int lastStoneWeight(int[] stones) {
        heap = new int[stones.length + 1];
        
        for (int stone: stones) {
            add(stone);
        }
        
        while (size() > 1) {
            int y = delMax();
            int x = delMax();
            
            if (x == y) {
                continue;
            } else {
                add(y - x);
            }
        }
        
        return size() > 0 ? delMax(): 0;
    }
    
    void add(int i) {
        heap[++n] = i;
        swim(n);
    }
    
    void sink(int i) {
        int left = 2 * i;
        int right = 2 * i + 1;
        int smallest = i;
        if (left < heap.length - 1 && heap[left] > heap[smallest]) {
            smallest = left;
        }
        
        if (right < heap.length - 1 && heap[right] > heap[smallest]) {
            smallest = right;
        }
        
        if (smallest != i) {
            swap(i, smallest);
            sink(smallest);
        }
    }
    
    void swim(int i) {
        int j = i / 2;
        if (j > 0 && heap[j] < heap[i]) {
            swap(i, j);
            swim(j);
        }
    }
    
    int delMax() {
        int max = heap[1];
        heap[1] = heap[n--];
        heap[n + 1] = 0;
        sink(1);
        return max;
    }
    
    int size() {
        return n;
    }
    
    void swap(int i, int j) {
        int t = heap[i];
        heap[i] = heap[j];
        heap[j] = t;
    }
}
