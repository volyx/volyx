---
author: "volyx"
title:  "Maximum Product of Three Numbers"
date: "2020-10-17"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given an integer array, find three numbers whose product is maximum and output the maximum product.

Example 1:

```txt
Input: [1,2,3]
Output: 6
```

Example 2:

```txt
Input: [1,2,3,4]
Output: 24
```

Note:

- The length of the given array will be in range [3,104] and all elements are in the range [-1000, 1000].
- Multiplication of any three numbers in the input won't exceed the range of 32-bit signed integer.

Solution:

```java
class Solution {
    public int maximumProduct(int[] nums) {
        int s1 = Integer.MAX_VALUE;
        int s2 = Integer.MAX_VALUE;
        int b1 = Integer.MIN_VALUE;
        int b2 = Integer.MIN_VALUE;
        int b3 = Integer.MIN_VALUE;

        for (int value: nums) {
            if (value < s1) {
                s2 = s1;
                s1 = value;
            } else if (value < s2) {
                s2 = value;
            }
            if (value > b3) {
                b1 = b2;
                b2 = b3;
                b3 = value;
            } else if (value > b2) {
                b1 = b2;
                b2 = value;
            } else if (value > b1) {
                b1 = value;
            }
        }
        return Math.max(s1 * s2 * b3, b1 * b2 * b3);
    }
}
