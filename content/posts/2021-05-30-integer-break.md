---
author: "volyx"
title:  "343. Integer Break"
date: "2021-05-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[343. Integer Break](https://leetcode.com/problems/integer-break/)

Given an integer n, break it into the sum of k positive integers, where k >= 2, and maximize the product of those integers.

Return the maximum product you can get.

```txt
Example 1:

Input: n = 2
Output: 1
Explanation: 2 = 1 + 1, 1 × 1 = 1.

Example 2:

Input: n = 10
Output: 36
Explanation: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36.
 ```

Constraints:

- 2 <= n <= 58


## Solution

```java
class Solution {
    public int integerBreak(int n) {
        /*
        2 = 1
        3 = 2 * 1;
        4 = 2 * 2 = 4
        5 = 2 * 3 = 6
        6 = 3 * 3 = 9
        7 = 2 * 2 * 3 = 12
        8 = 2 * 3 * 3= 18
        9 = 3 * 3 * 3 = 27
        10 = 2 * 2 * 3 * 3 = 36
        11 = 2 * 2 * 2 * 2 * 3
        12 = 2 * 2 * 2 * 2 * 2 * 2
        13 = 2 * 2 * 2 * 2 * 3 * 3
        */
        if (n == 2) return 1;
        if (n == 3) return 2;
        int product = 1;
        while (n > 1) {
            if (n % 2 == 1 || n % 3 == 0) {
                product *= 3;
                n -= 3;
            } else {
                product *= 2;
                n -= 2;
            }
        }
        return product;
    }
}
```
