---
author: "volyx"
title:  "977. Squares of a Sorted Array"
date: "2021-07-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "sort", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[977. Squares of a Sorted Array](https://leetcode.com/problems/squares-of-a-sorted-array/)

Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

```txt
Example 1:

Input: nums = [-4,-1,0,3,10]
Output: [0,1,9,16,100]
Explanation: After squaring, the array becomes [16,1,0,9,100].
After sorting, it becomes [0,1,9,16,100].

Example 2:

Input: nums = [-7,-3,2,3,11]
Output: [4,9,9,49,121]
```

Constraints:

- 1 <= nums.length <= 104
- -104 <= nums[i] <= 104
- nums is sorted in non-decreasing order.

 
Follow up: Squaring each element and sorting the new array is very trivial, could you find an O(n) solution using a different approach?

## Solution

```java
class Solution {
    public int[] sortedSquares(int[] nums) {
        int n = nums.length;
        int[] res = new int[n];
        
        int j = n - 1;
        int lo = 0;
        int hi = n - 1;
        
        while (lo <= hi) {
            
            int left = nums[lo] * nums[lo];
            int right = nums[hi] * nums[hi];
            
            if (right > left) {
                res[j] = right;
                hi--;
                j--;
            } else {
                lo++;
                res[j] = left;
                j--;
            }
        }
        return res;
    }
}
```

## Solution 2021-11-18

```java
class Solution {
    public int[] sortedSquares(int[] nums) {
        int n = nums.length;
        int[] res = new int[n];
        
        int lo = 0;
        int hi = n - 1;
        
        for (int index = n - 1; index >= 0; index--) {
            if (nums[lo] * nums[lo] > nums[hi] * nums[hi]) {
                res[index] = nums[lo] * nums[lo];
                lo++;
            } else {
                res[index] = nums[hi] * nums[hi];
                hi--;
            }
        }
        return res;
    }
}
```

## Solution 2021-11-30

```java
class Solution {
    public int[] sortedSquares(int[] nums) {
        int[] res = new int[nums.length];
        int lo = 0;
        int hi = nums.length - 1;
        for (int k = nums.length - 1; k >= 0; k--) {
            if (nums[lo] * nums[lo] < nums[hi] * nums[hi]) {
                res[k] = nums[hi] * nums[hi];
                hi--;
            } else {
                res[k] = nums[lo] * nums[lo];
                lo++;
            }
        }
        return res;
    }
}
```
