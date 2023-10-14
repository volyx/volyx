---
author: "volyx"
title:  "Arranging Coins"
date: "2020-07-02"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.

Given n, find the total number of full staircase rows that can be formed.

n is a non-negative integer and fits within the range of a 32-bit signed integer.

Example 1:
```
n = 5

The coins can form the following rows:
¤
¤ ¤
¤ ¤
```

Because the 3rd row is incomplete, we return 2.

Example 2:
```
n = 8

The coins can form the following rows:
¤
¤ ¤
¤ ¤ ¤
¤ ¤
```

Because the 4th row is incomplete, we return 3.


Solution:

```java
class Solution {
    
    public int arrangeCoins(int n) {
        return (int) (Math.sqrt(2 * (long)n + 0.25) - 0.5);
    }
    
    public int arrangeCoins3(int n) {
        long left = 0;
        long right = n;
        
        long k = 0; 
        long curr = 0;
        while (left <= right) {
            k = left + (right - left) / 2;
            
            curr = k * (k + 1) / 2;
            
            if (curr == n) return (int) k;
            
            if (curr > n) {
                right = k - 1;
            } else {
                left = k + 1;
            }
        }
        return (int) right;
    }
    
    public int arrangeCoins2(int n) {
        int i = 1;
        int count = 0;
        while (n > 0) {
            n = n - i;
            i++;
            if (n >= 0)
                count++;
        }
        return count;
    }
}
