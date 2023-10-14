---
author: "volyx"
title:  "266. Palindrome Permutation"
date: "2021-11-27"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![266. Palindrome Permutation](https://leetcode.com/problems/palindrome-permutation/)

Given a string s, return true if a permutation of the string could form a palindrome.

```txt
Example 1:

Input: s = "code"
Output: false

Example 2:

Input: s = "aab"
Output: true

Example 3:

Input: s = "carerac"
Output: true
```

Constraints:

- 1 <= s.length <= 5000
- s consists of only lowercase English letters.

## Solution

```java
class Solution {
    public boolean canPermutePalindrome(String s) {
        int[] freq = new int[256];
        for (char c: s.toCharArray()) {
            freq[c]++;
        }
        int count = 0;
        for (int f: freq) {
            count += f % 2;
        }
        return count <= 1;
    }
}
```
