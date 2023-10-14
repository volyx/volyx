---
author: "volyx"
title:  "Palindromic Substrings"
date: "2020-05-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a string, your task is to count how many palindromic substrings in this string.

The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.

Example 1:
```
Input: "abc"
Output: 3
Explanation: Three palindromic strings: "a", "b", "c".
```
 

Example 2:
````
Input: "aaa"
Output: 6
Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
```
 

Note:
```
    The input string length won't exceed 1000.
```
 
Solution 

```java
class Solution {
    public int countSubstrings(String s) {
        int n = s.length();
        
        int[][] a = new int[n][n];
        int count = 0;        
        for (int i = 0; i < n; i++) {
            a[i][i] = 1;
            count++;
        }
        
            
        for (int col = 1; col < n; col++) {
            for (int row = 0; row < col; row++) {
                if (row == col - 1 && s.charAt(col) == s.charAt(row)) {
                    a[row][col] = 1;
                    count++;
                } else if (a[row + 1][col - 1] == 1 && s.charAt(col) == s.charAt(row) ) {
                     a[row][col] = 1;
                    count++;
                }
            }
        }
        
        return count;
    }
}
```

![example](/images/2020-05-15-palindromic-substring_1_optimized.png)

![example](/images/2020-05-15-palindromic-substring-matrix_optimized.png)

