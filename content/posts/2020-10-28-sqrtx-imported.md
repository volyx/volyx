---
author: "volyx"
title:  "Sqrt(x)"
date: "2020-10-28"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Implement int sqrt(int x).

Compute and return the square root of x, where x is guaranteed to be a non-negative integer.

Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.

Example 1:

```txt
Input: 4
Output: 2
```

Example 2:

```txt
Input: 8
Output: 2
```

Explanation: The square root of 8 is 2.82842..., and since 
             the decimal part is truncated, 2 is returned.

Solution:

```java
class Solution {
    public int mySqrt(int x) {
        if (x == 0) return 0;
        int l = 0;
        int r = x;
        while (l < r) {
            int mid = l + (r - l) / 2;
            if (mid * mid <= x) {
                l = mid + 1;
            } else {
                r = mid;
            }
        }
        return l - 1;
    }
}
