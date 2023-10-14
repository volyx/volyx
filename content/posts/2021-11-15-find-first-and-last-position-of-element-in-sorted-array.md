---
author: "volyx"
title: "34. Find First and Last Position of Element in Sorted Array"
date: "2021-11-13"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "binary-search", "uber"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![34. Find First and Last Position of Element in Sorted Array](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/)

Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

If target is not found in the array, return [-1, -1].

You must write an algorithm with O(log n) runtime complexity.

```txt
Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]

Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]

Example 3:

Input: nums = [], target = 0
Output: [-1,-1]
```

Constraints:

- 0 <= nums.length <= 10^5
- -10^9 <= nums[i] <= 10^9
- nums is a non-decreasing array.
- -10^9 <= target <= 10^9

## Solution

```java
class Solution {
    public int[] searchRange(int[] nums, int target) {
        
        int lo = 0;
        int hi = nums.length - 1;
        
        while (lo <= hi) {
            int mid = lo + (hi - lo) / 2;
            if (nums[mid] == target) {
                // 12345 6 6666666667890
                if (mid == 0 || nums[mid - 1] != target) {
                    lo = mid;
                    break;
                } else {
                    hi = mid - 1;
                }
                
            } else if (nums[mid] < target) {
                lo = mid + 1;
            } else {
                hi = mid - 1;
            }
        }
        
        if (nums.length == 0 || lo > hi || nums[lo] != target) {
            return new int[] {-1, -1};
        }
        
        int[] res = new int[] {lo, -1};
        
        lo = 0;
        hi = nums.length - 1;
        while (lo <= hi) {
             int mid = lo + (hi - lo) / 2;
            if (nums[mid] == target) {
                // 12345666666666 6 7890
                if (mid == nums.length - 1 || nums[mid + 1] != target) {
                    hi = mid;
                    break;
                } else {
                    lo = mid + 1;
                }
                
            } else if (nums[mid] < target) {
                lo = mid + 1;
            } else {
                hi = mid - 1;
            }
        }
        
        res[1] = hi;
        return res;
    }
    
    
    public int[] searchRangeLinear(int[] nums, int target) {
        
        int lo = 0;
        int hi = nums.length - 1;
        
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            // 123456789
            //        ^
            //     5
            //     lo   hi
            if (nums[mid] < target) {
                lo = mid + 1;   
            } else {
                hi = mid;
            }
        }
        
        if (nums.length == 0 || nums[lo] != target) {
            return new int[] {-1, -1};
        }
        
        int start = lo;
        
        // linear scan
        while (start + 1 < nums.length && nums[lo] == nums[start + 1]) {
            start++;
        }
        
        return new int[] {lo, start};
    }
}
```

## Solution 2021-11-29

```java
class Solution {
    public int[] searchRange(int[] nums, int target) {
        
        int lo = binarySearch(nums, target, true);
        
        if (lo == -1 || nums[lo] != target) {
            return new int[] {-1, -1};
        }
        
        int hi = binarySearch(nums, target, false);
        return new int[] {lo, hi};
    }
    
    int binarySearch(int[] nums, int target, boolean isFirst) {
        int lo = 0;
        int hi = nums.length - 1;
        
        while (lo <= hi) {
            int mid = lo + (hi - lo) / 2;
            if (nums[mid] == target) {
               
               if (isFirst) {
                   if (mid == lo || target != nums[mid - 1]) {
                       return mid;
                   }
                   hi = mid - 1;
               } else {
                   if (mid == hi || target != nums[mid + 1]) {
                       return mid;
                   }
                   lo = mid + 1;
               }
            } else if (nums[mid] > target) {
                hi = mid - 1;
            } else {
                lo = mid + 1;
            }
        }
        
        return -1;
        
    }
}
```
