---
author: "volyx"
title:  "1897. Redistribute Characters to Make All Strings Equal"
date: "2021-06-13"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1897. Redistribute Characters to Make All Strings Equal](https://leetcode.com/problems/redistribute-characters-to-make-all-strings-equal/)

You are given an array of strings words (0-indexed).

In one operation, pick two distinct indices i and j, where words[i] is a non-empty string, and move any character from words[i] to any position in words[j].

Return true if you can make every string in words equal using any number of operations, and false otherwise.

```txt
Example 1:

Input: words = ["abc","aabc","bc"]
Output: true
Explanation: Move the first 'a' in words[1] to the front of words[2],
to make words[1] = "abc" and words[2] = "abc".
All the strings are now equal to "abc", so return true.

Example 2:

Input: words = ["ab","a"]
Output: false
Explanation: It is impossible to make all the strings equal using the operation.
```

Constraints:

- 1 <= words.length <= 100
- 1 <= words[i].length <= 100
- words[i] consists of lowercase English letters.

## Solution

```java
class Solution {
    public boolean makeEqual(String[] words) {
        int n = words.length;
        int[] freq = new int[256];
        
        for (String word: words) {
            for (char c : word.toCharArray()) {
                freq[c]++;
            }
        }
        
        for (int i: freq) {
            if ((i != 0) && (i % n != 0)) {
                return false;
            }
        }
        return true;
    }
}
```
