---
author: "volyx"
title:  338. Counting Bits"
date: "2021-06-13"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "bit-manipulation"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[338. Counting Bits](https://leetcode.com/problems/counting-bits/)

Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.

```txt
Example 1:

Input: n = 2
Output: [0,1,1]
Explanation:
0 --> 0
1 --> 1
2 --> 10

Example 2:

Input: n = 5
Output: [0,1,1,2,1,2]
Explanation:
0 --> 0
1 --> 1
2 --> 10
3 --> 11
4 --> 100
5 --> 101
```

Constraints:

- 0 <= n <= 105

Follow up:

- It is very easy to come up with a solution with a runtime of O(n log n). Can you do it in linear time O(n) and possibly in a single pass?
- Can you do it without using any built-in function (i.e., like __builtin_popcount in C++)?

## Solution

```java
class Solution {
    public int[] countBits(int n) {
        int[] bits = new int[n + 1];
        
        for (int num = 0; num < bits.length; num++) {
            int count = 0;
            int i = 0;
            while (i < 32) {
                if ((num & (1 << i)) != 0) {
                    count++;
                }
                i++;
            }
            bits[num] = count;
        }
        
        return bits;
    }
}
```
