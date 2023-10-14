---
author: "volyx"
title:  "Hamming Distance"
date: "2020-07-07"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

Given two integers x and y, calculate the Hamming distance.

Note:
0 ≤ x, y < 231.

```txt
Example:
Input: x = 1, y = 4

Output: 2

Explanation:
1   (0 0 0 1)
4   (0 1 0 0)
       ↑   ↑

The above arrows point to positions where the corresponding bits are different.
```

Solution:

```java
class Solution {
    public int hammingDistance2(int x, int y) {
        int result  = 0;
        
        while (x > 0 || y > 0) {
            result += (x % 2) ^ (y % 2);
            x >>=1;
            y >>=1;
        }
        return result;
    }
    
    public int hammingDistance(int x, int y) {
        return Integer.bitCount(x ^ y);
    }

        /*
    1   (0 0 0 1)
    4   (0 1 0 0)
    
    */
    
    public int hammingDistance3(int x, int y) {
        int count = 0;
        while (x != 0 || y != 0) {
            if ((x & 1) != (y & 1)) {
                count++;
            }
            
            x = x >> 1;
            y = y >> 1;
        }
        return count;
    }
}
