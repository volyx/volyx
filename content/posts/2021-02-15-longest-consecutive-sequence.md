---
author: "volyx"
title:  "128. Longest Consecutive Sequence"
date: "2021-02-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "union-find","array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/longest-consecutive-sequence/]

Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

```txt
Example 1:

Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

Example 2:

Input: nums = [0,3,7,2,5,8,4,6,0,1]
Output: 9
```

Constraints:

- 0 <= nums.length <= 104
- -109 <= nums[i] <= 109

```java
class Solution {
    public int longestConsecutive(int[] nums) {
        Map<Integer, Integer> valueToIndex = new HashMap<>();
        UF uf = new UF(nums.length);
        for (int i = 0; i < nums.length; i++) {
            int value = nums[i];
            if (valueToIndex.containsKey(value)) {
                continue;
            }
            
            if (valueToIndex.containsKey(value - 1)) {
                uf.union(i, valueToIndex.get(value - 1));
            }
            
            if (valueToIndex.containsKey(value + 1)) {
                uf.union(i, valueToIndex.get(value + 1));
            }
            
            valueToIndex.put(value, i);
        }
        
        return uf.maxSize;
    }
    
    static class UF {
        private int[] a;
        private int[] sz;
        private int maxSize = 0;
        UF(int n) {
            this.a = new int[n];
            this.sz = new int[n];
            for (int i = 0; i < n; i++) {
                a[i] = i;
                sz[i] = 1;
                maxSize = 1;
            }
        }
        
        void union(int p, int q) {
            int pid = find(p);
            int qid = find(q);
            
            if (sz[pid] > sz[qid]) {
                a[qid] = pid;
                sz[pid] += sz[qid];
                maxSize = Math.max(maxSize, sz[pid]);
            } else {
                a[pid] = qid;
                sz[qid] += sz[pid];
                maxSize = Math.max(maxSize, sz[qid]);
            }
        }
        
        int find(int p) {
            while (p != a[p]) {
                p = a[p];
            }
            return p;
        }
    }
}
