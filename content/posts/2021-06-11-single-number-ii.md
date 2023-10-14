---
author: "volyx"
title:  "137. Single Number II"
date: "2021-06-11"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "bit-manipulation"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[137. Single Number II](https://leetcode.com/problems/single-number-ii/)

Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it.

You must implement a solution with a linear runtime complexity and use only constant extra space.

```txt
Example 1:

Input: nums = [2,2,3,2]
Output: 3

Example 2:

Input: nums = [0,1,0,1,0,1,99]
Output: 99
```

Constraints:

- 1 <= nums.length <= 3 * 104
- -231 <= nums[i] <= 231 - 1
- Each element in nums appears exactly three times except for one element which appears once.

## Solution

```java
class Solution {
    public int singleNumber(int[] nums) {
        long sum = 0;
        Set<Integer> set = new HashSet<>();
        for (int num: nums) {
            set.add(num);
            sum+=num;
        }
        long uniqueSum = 0;
        for (int num: set) {
            uniqueSum += num;
        }
        long remainder = (3 * uniqueSum) - sum;
        return (int) (remainder / 2);
    }
}
```
