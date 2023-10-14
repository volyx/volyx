---
author: "volyx"
title:  "231. Power of Two"
date: "2021-06-07"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "bits"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[231. Power of Two](https://leetcode.com/problems/power-of-two/)

Given an integer n, return true if it is a power of two. Otherwise, return false.

An integer n is a power of two, if there exists an integer x such that n == 2x.

```txt
Example 1:

Input: n = 1
Output: true
Explanation: 20 = 1

Example 2:

Input: n = 16
Output: true
Explanation: 24 = 16

Example 3:

Input: n = 3
Output: false

Example 4:

Input: n = 4
Output: true

Example 5:

Input: n = 5
Output: false
```

Constraints:

- -231 <= n <= 231 - 1

Follow up: Could you solve it without loops/recursion?

## Solution

```java
class Solution {
    
    // reset rightmost 1-bit
    // 00000100 4
    // 00000011 3
    // 00000000 0
    public boolean isPowerOfTwo(int n) {
       if (n == 0) return false; 
       long x = (long) n;
       return (x & (x - 1)) == 0;
    }
    
    // 00000100 4
    // 11111011 -4
    // 00000100 4 get rightmost 1-bit
    public boolean isPowerOfTwo3(int n) {
       if (n == 0) return false; 
       long x = (long) n;
       return (x & (-x)) == x;
    }
    
    public boolean isPowerOfTwo2(int n) {
       if (n == 0) return false;
       while (n % 2 == 0) {
           n /= 2;
       } 
       return n == 1; 
    }
}
```
