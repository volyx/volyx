---
author: "volyx"
title:  "1071. Greatest Common Divisor of Strings"
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

[1071. Greatest Common Divisor of Strings](https://leetcode.com/problems/greatest-common-divisor-of-strings/)

For two strings s and t, we say "t divides s" if and only if s = t + ... + t  (t concatenated with itself 1 or more times)

Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.

```txt
Example 1:

Input: str1 = "ABCABC", str2 = "ABC"
Output: "ABC"

Example 2:

Input: str1 = "ABABAB", str2 = "ABAB"
Output: "AB"

Example 3:

Input: str1 = "LEET", str2 = "CODE"
Output: ""

Example 4:

Input: str1 = "ABCDEF", str2 = "ABC"
Output: ""
```

Constraints:

- 1 <= str1.length <= 1000
- 1 <= str2.length <= 1000
- str1 and str2 consist of English uppercase letters.

## Solution

```java
class Solution {
    // ABABABA
    // ABAB
    public String gcdOfStrings(String str1, String str2) {
        
        if (str1.length() < str2.length()) {
            return gcdOfStrings(str2, str1);
        }
        
        if (!str1.startsWith(str2)) {
            return "";
        }
        
        if (str2.isEmpty()) {
            return str1;
        }
        
        return gcdOfStrings(str1.substring(str2.length()), str2);
    }
}
```
