---
author: "volyx"
title:  "Contiguous Array"
date: "2020-04-17"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "mock"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.

Example 1:

```txt
Input: [0,1]
Output: 2
Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.

Example 2:
```txt
Input: [0,1,0]
Output: 2
Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
```

Note: The length of the given binary array will not exceed 50,000.

A picture inside solution secture helps a lot. [Solution](https://leetcode.com/problems/contiguous-array/solution/)

![picture](https://leetcode.com/problems/contiguous-array/Figures/535_Contiguous_Array.PNG)

```java
class Solution {
    public int findMaxLength(int[] nums) {
        Map<Integer, Integer> firstOc = new HashMap<>();
        firstOc.put(0, -1);
        int maxLength = 0;
        int counter = 0;

        for (int i = 0; i < nums.length; i++) {
            counter+= (nums[i] == 0) ? -1: 1;
            Integer it = firstOc.get(counter);
            if (it != null) {
                maxLength = Math.max(maxLength, i - it);
            } else {
                firstOc.put(counter, i);
            }
        }
        return maxLength;
    }
}
