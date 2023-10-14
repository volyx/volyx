---
author: "volyx"
title:  "162. Find Peak Element"
date: "2021-07-10"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "binary-search"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[162. Find Peak Element](https://leetcode.com/problems/find-peak-element/)

A peak element is an element that is strictly greater than its neighbors.

Given an integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.

You may imagine that nums[-1] = nums[n] = -∞.

You must write an algorithm that runs in O(log n) time.

```txt
Example 1:

Input: nums = [1,2,3,1]
Output: 2
Explanation: 3 is a peak element and your function should return the index number 2.

Example 2:

Input: nums = [1,2,1,3,5,6,4]
Output: 5
Explanation: Your function can return either index number 1 where the peak element is 2, or index number 5 where the peak element is 6.
```

Constraints:

- 1 <= nums.length <= 1000
- -2^31 <= nums[i] <= 2^31 - 1
- nums[i] != nums[i + 1] for all valid i.

## Solution

```java
class Solution {
    public int findPeakElement(int[] nums) {
        int lo = 0; 
        int hi = nums.length - 1;
        
        if (nums.length == 1) {
            return 0;
        }
        
        while (lo <= hi) {
            
            int mid = lo + (hi - lo) / 2;
            
            if (isPeak(nums, mid)) {
                return mid;
            } else if (nums[mid + 1] > nums[mid]) {
                lo = mid + 1;
            } else {
                hi = mid - 1;
            }
            
        }
        return lo;
    }
    
    boolean isPeak(int[] nums, int x) {
        if (x == 0) {
            return nums[x] > nums[x + 1];
        }
        
        if (x == nums.length - 1) {
            return nums[x] > nums[x - 1];
        }
        
        return nums[x] > nums[x - 1] && nums[x] > nums[x + 1];
    }
}
```

## Solution II

```java
class Solution {
    public int findPeakElement(int[] nums) {
      int lo = 0;
      int hi = nums.length - 1;
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (nums[mid] < nums[mid + 1]) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }

}
```
