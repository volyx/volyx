---
author: "volyx"
title:  "1027. Longest Arithmetic Subsequence"
date: "2021-10-12"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1027. Longest Arithmetic Subsequence](https://leetcode.com/problems/longest-arithmetic-subsequence/)

Given an array nums of integers, return the length of the longest arithmetic subsequence in nums.

Recall that a subsequence of an array nums is a list nums[i1], nums[i2], ..., nums[ik] with 0 <= i1 < i2 < ... < ik <= nums.length - 1, and that a sequence seq is arithmetic if seq[i+1] - seq[i] are all the same value (for 0 <= i < seq.length - 1).

```txt
Example 1:

Input: nums = [3,6,9,12]
Output: 4
Explanation: 
The whole array is an arithmetic sequence with steps of length = 3.

Example 2:

Input: nums = [9,4,7,2,10]
Output: 3
Explanation: 
The longest arithmetic subsequence is [4,7,10].

Example 3:

Input: nums = [20,1,15,3,10,5,8]
Output: 4
Explanation: 
The longest arithmetic subsequence is [20,15,10,5].
```

Constraints:

- 2 <= nums.length <= 1000
- 0 <= nums[i] <= 500

## Solution

```java
class Solution {
    
    
    /*
    
    12 - 9
    12 - 6
    12 - 3
    
     9 - 6
     9 - 3
     
     6 - 3
    
    0:
        9 - 1
        3 - 4
    1:
        6 - 3
        3 - 3
    2:
        3 - 2
        6 - 2
    3:  
        3 - 1
        6 - 1
        9 - 1
    
    */
    
    public int longestArithSeqLength(int[] nums) {
        Map<Integer, Integer>[] maps = new HashMap[nums.length];
        
        for (int i = 0; i < nums.length; i++) {
            maps[i] = new HashMap<Integer, Integer>();
        }
        
        int max = 0;
        
        for (int j = nums.length - 1; j >= 0; j--) {
            for (int i = j - 1; i >= 0; i--) {
                int diff = nums[j] - nums[i];
                maps[i].put(diff, maps[j].getOrDefault(diff, 1) + 1);
                max = Math.max(max, maps[i].get(diff));
            }
        } 
        
        
        return max;
    }
}
```
