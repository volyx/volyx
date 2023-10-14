---
author: "volyx"
title:  "680. Valid Palindrome II"
date: "2021-06-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "two-pointers"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[680. Valid Palindrome II](https://leetcode.com/problems/valid-palindrome-ii/)

Given a string s, return true if the s can be palindrome after deleting at most one character from it.

```txt
Example 1:

Input: s = "aba"
Output: true

Example 2:

Input: s = "abca"
Output: true
Explanation: You could delete the character 'c'.

Example 3:

Input: s = "abc"
Output: false
```

Constraints:

- 1 <= s.length <= 105
- s consists of lowercase English letters.

## Solution

```java
class Solution {
    public boolean validPalindrome(String s) {
        return palindrom(s, 0);
    }
    
    boolean palindrom(String s, int count) {
        int i = 0; 
        int n = s.length();
        
        while (i < n / 2) {
            char c1 = s.charAt(i);
            char c2 = s.charAt(n - i - 1);
            
            if (c1 == c2) {
                i++;
                continue;
            } else {
                if (count == 0) {
                    StringBuilder sb1 = new StringBuilder(s);
                    sb1.deleteCharAt(i);
                    boolean res1 = palindrom(sb1.toString(), 1);
                    if (res1) return true;
                    StringBuilder sb2 = new StringBuilder(s);
                    sb2.deleteCharAt(n - i - 1);
                    return palindrom(sb2.toString(), 1);
                }
                return false;
            }
        }
        
        return true;
    }
}
```

## Solution 2021-11-21

```java
class Solution {
    public boolean validPalindrome(String s) {
        return validatePalindrom(s, 1, 0, s.length() - 1);
    }
    
    boolean validatePalindrom(String s, int deleted, int lo, int hi) {
        while (lo < hi) {
            if (s.charAt(lo) == s.charAt(hi)) {
                lo++;
                hi--;
            } else {
                if (deleted == 0) {
                    return false;
                }
                return 
                    validatePalindrom(s, 0, lo + 1, hi) ||                                                   validatePalindrom(s, 0, lo, hi - 1);
            }
        }
        
        return true;
    }
}
```

## Solution 2022-01-22

```java
class Solution {
    public boolean validPalindrome(String s) {
        char[] symbols = s.toCharArray();
        return validPalindrome(symbols, 0, s.length() - 1, 1);
    }
    
    boolean validPalindrome(char[] symbols, int i, int j, int count) {
        while (i < j) {
            if (symbols[i] == symbols[j]) {
                i++;
                j--;
                continue;
            } else {
                if (count > 0) {
                    return validPalindrome(symbols, i, j - 1, 0) || validPalindrome(symbols, i + 1, j, 0);
                } else {
                    return false;
                }
            }
        }
        return true;
    }
}
```