---
author: "volyx"
title:  "Max Consecutive Ones"
date: "2020-06-23"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a binary array, find the maximum number of consecutive 1s in this array.

Example 1:
```
Input: [1,1,0,1,1,1]
Output: 3
Explanation: The first two digits or the last three digits are consecutive 1s.
    The maximum number of consecutive 1s is 3.
```

Note:
- The input array will only contain 0 and 1.
- The length of input array is a positive integer and will not exceed 10,000


Solution:

```java
class Solution {
    public int findMaxConsecutiveOnes(int[] nums) {
        int sum = 0;
        int ans = 0;
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == 1) {
                sum++;
            } else {
                sum = 0;
            }
            ans = Math.max(ans, sum);
        }
        return ans;
    }
}
