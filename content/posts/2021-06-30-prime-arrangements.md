---
author: "volyx"
title:  "1175. Prime Arrangements"
date: "2021-06-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "math"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1175. Prime Arrangements](https://leetcode.com/problems/prime-arrangements/)

Return the number of permutations of 1 to n so that prime numbers are at prime indices (1-indexed.)

(Recall that an integer is prime if and only if it is greater than 1, and cannot be written as a product of two positive integers both smaller than it.)

Since the answer may be large, return the answer modulo 10^9 + 7.

```txts
Example 1:

Input: n = 5
Output: 12
Explanation: For example [1,2,5,4,3] is a valid permutation, but [5,2,3,4,1] is not because the prime number 5 is at index 1.

Example 2:

Input: n = 100
Output: 682289015
```

Constraints:

- 1 <= n <= 100

## Solution

```java
class Solution {
    static long MOD = 1_000_000_007L;
    public int numPrimeArrangements(int n) {
        int count = 0;
        for (int i = 2; i < n + 1; i++) {
            if (i == 2 || i == 3 || isPrime(i)) {
                count++;
            }
        }
        long pn = factorial(count) % MOD;
        long npn = factorial(n - count) % MOD;
        return  (int) (pn * npn % MOD);
    }
    
    boolean isPrime(int n) {
        int m = (int) Math.sqrt(n) + 1;
        
        for (int i = 2; i < m; i++) {
            if (n % i == 0) return false;
        }
        return true;
    }
    
    
    long factorial(int n) {
        long res = 1;
        for (int i = 1; i < n + 1; i++) {
            res =  res * i;
            res %= MOD;
        }
        return res;
    }
}
```
