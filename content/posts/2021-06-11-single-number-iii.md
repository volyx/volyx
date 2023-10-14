---
author: "volyx"
title:  "260. Single Number III"
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

[260. Single Number III](https://leetcode.com/problems/single-number-iii/)

Given an integer array nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once. You can return the answer in any order.

You must write an algorithm that runs in linear runtime complexity and uses only constant extra space.

```txt
Example 1:

Input: nums = [1,2,1,3,2,5]
Output: [3,5]
Explanation:  [5, 3] is also a valid answer.

Example 2:

Input: nums = [-1,0]
Output: [-1,0]

Example 3:

Input: nums = [0,1]
Output: [1,0]
```

Constraints:

- 2 <= nums.length <= 3 * 104
- -231 <= nums[i] <= 231 - 1
- Each integer in nums will appear twice, only two integers will appear once.



## Solution

```java
class Solution {
    public int[] singleNumber(int[] nums) {
        int bitmask = 0;
        for (int num: nums) {
            bitmask ^= num;
        }
        
        // right most bit
        int diff = bitmask & (-bitmask);
        // x = 011 = 3
        // y = 101 = 5
        // bitmask = 110 = 6
        // diff = 010

        // 2 num = 10
        // 3 num = 11
        // 2 num = 10
        // x = 10 ^ 11 ^ 10  = 3
        int x = 0;
        for (int num: nums) {
            if ((diff & num ) != 0) {
                x = x ^ num;
            }
        }
        return new int[]{x, bitmask ^ x};
    }
}
```
