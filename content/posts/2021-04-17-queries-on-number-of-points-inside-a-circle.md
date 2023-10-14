---
author: "volyx"
title:  "1016. Binary String With Substrings Representing 1 To N"
date: "2021-04-17"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "string", "rabin-karp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1016. Binary String With Substrings Representing 1 To N](https://leetcode.com/problems/binary-string-with-substrings-representing-1-to-n/)

Given a binary string S (a string consisting only of '0' and '1's) and a positive integer N, return true if and only if for every integer X from 1 to N, the binary representation of X is a substring of S.

```txt
Example 1:

Input: S = "0110", N = 3
Output: true
```

```txt
Example 2:

Input: S = "0110", N = 4
Output: false
```

Note:

- 1 <= S.length <= 1000
- 1 <= N <= 10^9

## Solution

```java
class Solution {
    public boolean queryString(String S, int N) {
        for (int i = 1; i <= N; i++) {
            String binary = Integer.toBinaryString(i);
            
            if (!searchRK(S, binary)) {
                return false;
            }
            
        }
        return true;
    }
    
    boolean search(String s, String p) {
        return s.contains(p);
    }
    
    boolean searchRK(String s, String p) {
        int n = s.length();
        int m = p.length();
        int x = 3;
        
        int ht = hash(p, 0, m, x, m);
        int hs = hash(s, 0, m, x, m);
        
        for (int i = 0; i < n - m; i++) {
            if (hs == ht) {
                return true;
            }
            hs = (hs * x - code(s, i) * pow(x, m) + code(s, i + m));
        }
        
        return ht == hs;
    }
    
    int code(String s, int i) {
        return s.charAt(i) - '0';
    }
    
    static int pow(int a, int b) {
        return (int) Math.pow(a, b);
    }
    
    int hash(String str, int s, int e, int x, int m) {
        int h = 0;
        int degree = m - 1;
        for (int i = s; i < e; i++) {
            h = h + code(str, i) * pow(x, degree);
            degree--;
        }
        return h;
    }
}
```
