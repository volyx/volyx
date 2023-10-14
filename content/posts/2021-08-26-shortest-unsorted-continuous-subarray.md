---
author: "volyx"
title:  "581. Shortest Unsorted Continuous Subarray"
date: "2021-08-26"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "monotonic-stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[581. Shortest Unsorted Continuous Subarray](https://leetcode.com/problems/shortest-unsorted-continuous-subarray/)

Given an integer array nums, you need to find one continuous subarray that if you only sort this subarray in ascending order, then the whole array will be sorted in ascending order.

Return the shortest such subarray and output its length.

```txt
Example 1:

Input: nums = [2,6,4,8,10,9,15]
Output: 5
Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.

Example 2:

Input: nums = [1,2,3,4]
Output: 0

Example 3:

Input: nums = [1]
Output: 0
```

Constraints:

- 1 <= nums.length <= 10^4
- -10^5 <= nums[i] <= 10^5

## Solution

```java
class Solution {
    
    /**
    
    [2,6,4,8,10,9,15]
    
    
    [2,6,4,13,10,12,15]
    
    [2,4,5,6,3] - increasing stack
    
    (2,4,5,6,3!)
    (2!)
    
    (15,12,10,13!) decreasing stack
    
    (15,13)
    
    
    
    */
    
    public int findUnsortedSubarray(int[] nums) {
        
        Stack<Integer> incStack = new Stack<>();
        
        int lo = nums.length;
        for (int i = 0; i < nums.length; i++) {
            while (incStack.size() > 0 && nums[i] < nums[incStack.peek()]) {
                lo = Math.min(lo, incStack.pop());
            }
            incStack.push(i);
        }
        
        Stack<Integer> decStack = new Stack<>();
        int hi = 0;
        for (int i = nums.length - 1; i >= 0; i--) {
            while (decStack.size() > 0 && nums[i] > nums[decStack.peek()]) {
                hi = Math.max(hi, decStack.pop());
            }
            decStack.push(i);
        }
                
        return hi - lo > 0 ? hi - lo + 1: 0;
    }
}
```
