---
author: "volyx"
title:  "1004. Max Consecutive Ones III"
date: "2021-06-24"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "sliding-window"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[11004. Max Consecutive Ones III](https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/)

Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.

```txt
Example 1:

Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
Output: 6
Explanation: [1,1,1,0,0,1,1,1,1,1,1]
Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.

Example 2:

Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
Output: 10
Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
```

Constraints:

- 1 <= nums.length <= 105
- nums[i] is either 0 or 1.
- 0 <= k <= nums.length

## Solution

```java
class Solution {
    public int longestOnes(int[] nums, int k) {
        int[] map = new int[2];
        int start = 0;
        int end = 0;
        int maxLen = 0;
        
        while (end < nums.length) {
            int val = nums[end];
            map[val]++;
            end++;
            while (map[0] > k) {
                int prev = nums[start];
                map[prev]--;
                start++;
            }
            maxLen = Math.max(maxLen, end - start);
        }
        return maxLen;
    }
}
```
