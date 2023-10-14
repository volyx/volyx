---
author: "volyx"
title:  "347. Top K Frequent Elements"
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

![https://leetcode.com/problems/top-k-frequent-elements/]

Given a non-empty array of integers, return the k most frequent elements.

```txt
Example 1:

Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]

Example 2:

Input: nums = [1], k = 1
Output: [1]
```

Note:

- You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
- Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
- It's guaranteed that the answer is unique, in other words the set of the top k frequent elements is unique.
- You can return the answer in any order.

```java
class Solution {
    public int[] topKFrequent(int[] nums, int k) {
       List<Integer>[] buckets = new List[nums.length + 1];
       Map<Integer, Integer> freq = new HashMap<>();
       for (int num: nums) {
            freq.put(num, freq.getOrDefault(num, 0) + 1);
       }
        
       for (var entry: freq.entrySet()) {
           List<Integer> bucket = buckets[entry.getValue()];
           if (bucket == null) {
               bucket = new ArrayList<>();
           }
           bucket.add(entry.getKey());
           buckets[entry.getValue()] =  bucket;
       } 
        
      int[] res = new int[k];
      int j = 0;
       for (int i = buckets.length - 1; i >= 0 && j < k; i--) {
           if (buckets[i] != null) {
              for (Integer val : buckets[i]) {
                  res[j++] = val;
              }
           }
       } 
       
       return res; 
    }
    
    public int[] topKFrequent2(int[] nums, int k) {
        Map<Integer, Integer> freq = new HashMap<>();
        for (int num: nums) {
            freq.put(num, freq.getOrDefault(num, 0) + 1);
        }
        PriorityQueue<Map.Entry<Integer, Integer>> q = new PriorityQueue<>((e1, e2) -> e1.getValue() - e2.getValue());
        
        for (Map.Entry<Integer, Integer> entry: freq.entrySet()) {
            q.add(entry);
            if (q.size() > k) {
                q.poll();
            }
            System.out.println(q);
        }
        
        int[] res = new int[q.size()];
        int i = 0;
        for (var entry: q) {
            res[i++] = entry.getKey();
        }
        return res;
    }
}
