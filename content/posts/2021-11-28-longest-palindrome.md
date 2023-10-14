---
author: "volyx"
title: "409. Longest Palindrome"
date: "2021-11-28"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![409. Longest Palindrome](https://leetcode.com/problems/longest-palindrome//)

Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

```txt
Example 1:

Input: s = "abccccdd"
Output: 7
Explanation:
One longest palindrome that can be built is "dccaccd", whose length is 7.

Example 2:

Input: s = "a"
Output: 1

Example 3:

Input: s = "bb"
Output: 2
```

Constraints:

- 1 <= s.length <= 2000
- s consists of lowercase and/or uppercase English letters only.

## Solution

```java
class Solution {
    public int longestPalindrome(String s) {
        int[] freq = new int[256];
        
        for (char c: s.toCharArray()) {
            freq[c]++;
        }
        
        int maxOdd = 0;
        int count = 0;
        for (int f: freq) {
            count += f / 2 * 2;
            if (count % 2 == 0 && f % 2 == 1) {
                count++;
            }
        }
        return count;
    }
}
```
