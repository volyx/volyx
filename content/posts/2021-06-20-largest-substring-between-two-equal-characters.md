---
author: "volyx"
title:  "1624. Largest Substring Between Two Equal Characters"
date: "2021-06-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1624. Largest Substring Between Two Equal Characters](https://leetcode.com/problems/largest-substring-between-two-equal-characters/)

Given a string s, return the length of the longest substring between two equal characters, excluding the two characters. If there is no such substring return -1.

A substring is a contiguous sequence of characters within a string.

```txt
Example 1:

Input: s = "aa"
Output: 0
Explanation: The optimal substring here is an empty substring between the two 'a's.

Example 2:

Input: s = "abca"
Output: 2
Explanation: The optimal substring here is "bc".

Example 3:

Input: s = "cbzxy"
Output: -1
Explanation: There are no characters that appear twice in s.

Example 4:

Input: s = "cabbac"
Output: 4
Explanation: The optimal substring here is "abba". Other non-optimal substrings include "bb" and "".
```

Constraints:

- 1 <= s.length <= 300
- s contains only lowercase English letters.

## Solution

```java
class Solution {
    public int maxLengthBetweenEqualCharacters(String s) {
        int[] dist = new int[256];
        int[] start = new int[256];
        Arrays.fill(start, Integer.MAX_VALUE);
        Arrays.fill(dist, Integer.MIN_VALUE);
        int max = -1;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            start[c] = Math.min(start[c], i);
            dist[c] = Math.max(dist[c], i - start[c]);
            max = Math.max(max, dist[c]);
        }
        
        return max == -1 ? -1: max - 1;
    }
}
```
