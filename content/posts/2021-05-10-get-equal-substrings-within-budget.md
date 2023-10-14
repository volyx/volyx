---
author: "volyx"
title:  "1208. Get Equal Substrings Within Budget"
date: "2021-05-10"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "string", "sliding-window"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1208. Get Equal Substrings Within Budget](https://leetcode.com/problems/get-equal-substrings-within-budget/)

You are given two strings s and t of the same length. You want to change s to t. Changing the i-th character of s to i-th character of t costs |s[i] - t[i]| that is, the absolute difference between the ASCII values of the characters.

You are also given an integer maxCost.

Return the maximum length of a substring of s that can be changed to be the same as the corresponding substring of twith a cost less than or equal to maxCost.

If there is no substring from s that can be changed to its corresponding substring from t, return 0.

```txt
Example 1:

Input: s = "abcd", t = "bcdf", maxCost = 3
Output: 3
Explanation: "abc" of s can change to "bcd". That costs 3, so the maximum length is 3.
```

```txt
Example 2:

Input: s = "abcd", t = "cdef", maxCost = 3
Output: 1
Explanation: Each character in s costs 2 to change to charactor in t, so the maximum length is 1.
```

```txt
Example 3:

Input: s = "abcd", t = "acde", maxCost = 0
Output: 1
Explanation: You can't make any change, so the maximum length is 1.
```

Constraints:

- 1 <= s.length, t.length <= 10^5
- 0 <= maxCost <= 10^6
- s and t only contain lower case English letters.

## Solution

```java
class Solution {
    public int equalSubstring(String s, String t, int maxCost) {
        int n = s.length();
        char[] source = s.toCharArray();
        char[] target = t.toCharArray();
        int max = 0;
        int cost = 0;
        int j = 0;
        for (int i = 0; i < n; i++) { 
            while (i + j < n) {
                int diff = Math.abs(source[i + j] - target[i + j]);
                if (diff + cost > maxCost) {
                    break;
                }
                cost += diff;
                j++;
            }
            if (j > 0) {
                max = Math.max(max, j);
                cost = cost - Math.abs(source[i] - target[i]);
                j--;
            }
        }
        return max;
    }
}
```
