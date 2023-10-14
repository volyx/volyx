---
author: "volyx"
title:  "Search in Rotated Sorted Array"
date: "2020-04-23"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode", "binary-search", "array", "repeat"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---


Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

You are given a target value to search. If found in the array return its index, otherwise return -1.

You may assume no duplicate exists in the array.

Your algorithm's runtime complexity must be in the order of O(log n).

```txt
Example 1:

Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4
```

```txt
Example 2:

Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1
```

Notes: Firstly, we find the index where the numbers start growing, than do basic binary search.

## Solution 1

```java
class Solution {
    public int search(int[] nums, int target) {

        if (nums.length == 0) {
            return -1;
        }

        int n = nums.length;

        int left = 0;
        int right = n - 1;

        // [4,5,6,7,0,1,2]
        while (left < right) {

            int mid = left + (right - left) / 2;

            if (nums[mid] > nums[right]) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }

        int start = left;
        left = 0;
        right = n - 1;
        if (target >= nums[start] && target <= nums[right]) {
            left = start;
        } else {
            right = start;
        }
        while (left <= right) {
            int mid = left + (right - left) / 2;

            if (nums[mid] == target) {
                return mid;
            }
            if (nums[mid] < target) {
                   left = mid + 1;
            } else {
              right = mid - 1;
            }
        }
        return -1;
    }
}
```

## Solution 01.06.2021

```java
    class Solution {
    public int search(int[] nums, int target) {
        int n = nums.length;
        int l = 0;
        int r = n - 1;
        while (l <= r) {
            int mid = l + (r - l) / 2;
            if (nums[mid] == target) {
                return mid;
            } else if (isInInterval(nums, target, l, mid)) {
               r = mid;
            } else {
               l = mid + 1;    
            }
        }
        return -1;
    }

    boolean isInInterval(int[] nums , int t, int l, int r) {
        // in sorted interval
        if (nums[l] <= nums[r]) {
            return t >= nums[l] && t <= nums[r];
        } else {
            // 4 5 6 .... 1 in shifed interval
            return t >= nums[l] || t <= nums[r];
        }
    }
}
```
