---
author: "volyx"
title:  "204. Count Primes"
date: "2021-06-29"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "math"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[204. Count Primes](https://leetcode.com/problems/count-primes/)

Count the number of prime numbers less than a non-negative number, n.

```txt
Example 1:

Input: n = 10
Output: 4
Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.

Example 2:

Input: n = 0
Output: 0

Example 3:

Input: n = 1
Output: 0
```

Constraints:

- 0 <= n <= 5 * 106

## Solution

```java
class Solution {
    public int countPrimes(int n) {
        boolean[] numbers = new boolean[n + 1];
        
        for (int p = 2; p <= (int) Math.sqrt(n); p++) {
            if (numbers[p] == false) {
                for (int j = p + p; j < n; j += p) {
                    numbers[j] = true;
                }
            } 
        }
        
        int count = 0;
        for (int i = 2; i < n; i++) {
            if (numbers[i] == false) {
                count++;
            }
        }
        return count;
    }
}
```
