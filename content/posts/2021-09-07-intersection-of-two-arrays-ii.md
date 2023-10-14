---
author: "volyx"
title:  "350. Intersection of Two Arrays II"
date: "2021-09-07"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[350. Intersection of Two Arrays II](https://leetcode.com/problems/intersection-of-two-arrays-ii/)

Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

```txt
Example 1:

Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]

Example 2:

Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
Explanation: [9,4] is also accepted.
```

Constraints:

- 1 <= nums1.length, nums2.length <= 1000
- 0 <= nums1[i], nums2[i] <= 1000

Follow up:

- What if the given array is already sorted? How would you optimize your algorithm?
- What if nums1's size is small compared to nums2's size? Which algorithm is better?
- What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

## Solution

```java
class Solution {
    public int[] intersect(int[] nums1, int[] nums2) {
        
        int[] freq1 = new int[1_001];
        int[] freq2 = new int[1_001];
        
        
        for (int i = 0; i < nums1.length; i++) {
            freq1[nums1[i]]++;
        }
        
        for (int i = 0; i < nums2.length; i++) {
            freq2[nums2[i]]++;
        }
        
        
        List<Integer> res = new ArrayList<>();
        
        for (int i = 0; i < 1_001; i++) {
            int j = 0; 
            while (j < Math.min(freq1[i] , freq2[i])) {
                res.add(i);
                j++;
            }
        }
        
        return toList(res);
    }
    
    int[] toList(List<Integer> res) {
        int[] a = new int[res.size()];
        
        for (int i = 0; i < res.size(); i++) {
            a[i] = res.get(i);
        }
        
        return a;
    }
}
```
