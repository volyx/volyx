---
author: "volyx"
title:  "1876. Substrings of Size Three with Distinct Characters"
date: "2021-05-29"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1876. Substrings of Size Three with Distinct Characters](https://leetcode.com/problems/substrings-of-size-three-with-distinct-characters/)

A string is good if there are no repeated characters.

Given a string s​​​​​, return the number of good substrings of length three in s​​​​​​.

Note that if there are multiple occurrences of the same substring, every occurrence should be counted.

A substring is a contiguous sequence of characters in a string.

```txt
Example 1:

Input: s = "xyzzaz"
Output: 1
Explanation: There are 4 substrings of size 3: "xyz", "yzz", "zza", and "zaz". 
The only good substring of length 3 is "xyz".

Example 2:

Input: s = "aababcabc"
Output: 4
Explanation: There are 7 substrings of size 3: "aab", "aba", "bab", "abc", "bca", "cab", and "abc".
The good substrings are "abc", "bca", "cab", and "abc".
```

Constraints:

- 1 <= s.length <= 100
- s​​​​​​ consists of lowercase English letters.

## Solution

```java
class Solution {
    public int countGoodSubstrings(String s) {
        int n = s.length();
        
        if (n < 3) {
            return 0;
        }
        int count = 0;
        for (int i = 2; i < n; i++) {
            if (s.charAt(i - 2) != s.charAt(i - 1) && s.charAt(i - 1) != s.charAt(i) && s.charAt(i - 2) != s.charAt(i)) {
                count++;
            }
        }
        return count;
    }
}
```
