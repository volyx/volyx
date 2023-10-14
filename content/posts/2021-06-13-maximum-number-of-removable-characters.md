---
author: "volyx"
title:  "1898. Maximum Number of Removable Characters"
date: "2021-06-13"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "binary-search"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1898. Maximum Number of Removable Characters](https://leetcode.com/problems/maximum-number-of-removable-characters)

You are given two strings s and p where p is a subsequence of s. You are also given a distinct 0-indexed integer array removable containing a subset of indices of s (s is also 0-indexed).

You want to choose an integer k (0 <= k <= removable.length) such that, after removing k characters from s using the first k indices in removable, p is still a subsequence of s. More formally, you will mark the character at s[removable[i]] for each 0 <= i < k, then remove all marked characters and check if p is still a subsequence.

Return the maximum k you can choose such that p is still a subsequence of s after the removals.

A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

```txt
Example 1:

Input: s = "abcacb", p = "ab", removable = [3,1,0]
Output: 2
Explanation: After removing the characters at indices 3 and 1, "abcacb" becomes "accb".
"ab" is a subsequence of "accb".
If we remove the characters at indices 3, 1, and 0, "abcacb" becomes "ccb", and "ab" is no longer a subsequence.
Hence, the maximum k is 2.

Example 2:

Input: s = "abcbddddd", p = "abcd", removable = [3,2,1,4,5,6]
Output: 1
Explanation: After removing the character at index 3, "abcbddddd" becomes "abcddddd".
"abcd" is a subsequence of "abcddddd".

Example 3:

Input: s = "abcab", p = "abc", removable = [0,1,2,3,4]
Output: 0
Explanation: If you remove the first index in the array removable, "abc" is no longer a subsequence.
```

Constraints:

- 1 <= p.length <= s.length <= 105
- 0 <= removable.length < s.length
- 0 <= removable[i] < s.length
- p is a subsequence of s.
- s and p both consist of lowercase English letters.
- The elements in removable are distinct.

## Solution

```java
class Solution {
    public int maximumRemovals(String s, String p, int[] removable) {
        char[] letters = s.toCharArray();
        int l = 0;
        int r = removable.length;   
        while (l <= r) {
            int mid = (r + l) / 2;
            for (int i = 0; i < mid; i++) {
                letters[removable[i]] = '/';
            }
            
            if (check(letters, p)) {
                l = mid + 1;
            } else {
                letters = s.toCharArray();
                r = mid - 1;
            } 
        }
        
        return r;
    }
    
    boolean check(char[] letters, String p) {
        int i1 = 0;
        int i2 = 0;
        
        while (i1 < letters.length && i2 < p.length()) {
            char curr1 = letters[i1];
            char curr2 = p.charAt(i2);
            
            if (letters[i1] != '/' && curr1 == curr2) {
                i2++;
            }
            i1++;
        }
        
        return p.length() == i2;
    }
}
```
