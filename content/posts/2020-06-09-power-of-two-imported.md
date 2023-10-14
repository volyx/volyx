---
author: "volyx"
title:  "Power of two"
date: "2020-06-09"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given an integer, write a function to determine if it is a power of two.

Example 1:
```
Input: 1
Output: true 
Explanation: 20 = 1
```

Example 2:
```
Input: 16
Output: true
Explanation: 24 = 16
```

Example 3:
```
Input: 218
Output: false
```


Solution:

```java
class Solution {
    public boolean isPowerOfTwo2(int n) {
        if (n == 0 ) {
            return false;
        }
        if (n == 1) {
            return true;
        }
        while (n % 2 == 0 && n > 2) {
            n = n / 2;
        }
        return n == 0 || n == 2;
    }
    public boolean isPowerOfTwo(int n) {
        if (n == 0 ) {
            return false;
        }
        if (n == Integer.MIN_VALUE) {
            return false;
        }
        return (n & (n - 1)) == 0;
    }
}
