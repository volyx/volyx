---
author: "volyx"
title:  "Last Stone Weight"
date: "2020-04-16"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

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
    public int lastStoneWeight(int[] stones) {
        PriorityQueue<Integer> heap = new PriorityQueue<>((s1, s2) -> {
            return -Integer.compare(s1, s2);
        });
        
        for (Integer stone: stones) {
            heap.add(stone);
        }
        
        System.out.println("heap size =" + heap.size());
        
        while (heap.size() > 1) {
            Integer a = heap.poll();
            Integer b = heap.poll();
            
            System.out.println("a = " + a + " b = " + b);
            
            if (a == b) {
                continue;
            }
            
            heap.add(Math.abs(a - b));
        }
        
        return heap.isEmpty() ? 0 : heap.poll();
    }
}
