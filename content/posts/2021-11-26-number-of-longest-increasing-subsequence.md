---
author: "volyx"
title:  "673. Number of Longest Increasing Subsequence"
date: "2021-11-26"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![673. Number of Longest Increasing Subsequence](https://leetcode.com/problems/number-of-longest-increasing-subsequence/)

Given an integer array nums, return the number of longest increasing subsequences.

Notice that the sequence has to be strictly increasing.

```txt
Example 1:

Input: nums = [1,3,5,4,7]
Output: 2
Explanation: The two longest increasing subsequences are [1, 3, 4, 7] and [1, 3, 5, 7].

Example 2:

Input: nums = [2,2,2,2,2]
Output: 5
Explanation: The length of longest continuous increasing subsequence is 1, and there are 5 subsequences' length is 1, so output 5.
```

Constraints:

- 1 <= nums.length <= 2000
- -10^6 <= nums[i] <= 10^6

## Solution

```java
class Solution {

    public int findNumberOfLIS(int[] nums) {
        int n = nums.length;
        int[] len = new int[n];
        int[] count = new int[n];
        int res = 0;
        int max = 0;
        for (int i = 0; i < n; i++) {
            len[i] = count[i] = 1;
            for (int j = 0; j < i; j++) {
                if (nums[i] > nums[j]) {
                    if (len[i] == len[j] + 1) {
                        count[i] += count[j];
                    } else if (len[i] < len[j] + 1) { // the same as in longest subsequence
                        len[i] = len[j] + 1; // len[i] = Math.max(len[i], len[j] + 1)
                        count[i] = count[j];
                    }
                } 
            }
            
            if (len[i] > max) {
                max = len[i];
                res = count[i];
            } else if (len[i] == max) {
                res += count[i];
            }
        }
        return res;
    }
}
```
