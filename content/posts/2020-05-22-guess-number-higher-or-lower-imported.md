---
author: "volyx"
title:  "Guess Number Higher or Lower"
date: "2020-05-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

Each letter in the magazine string can only be used once in your ransom note.

Example 1:
```
Input: ransomNote = "a", magazine = "b"
Output: false
```

Example 2:
```
Input: ransomNote = "aa", magazine = "ab"
Output: false
```

Example 3:
```
Input: ransomNote = "aa", magazine = "aab"
Output: true
```

Constraints:
You may assume that both strings contain only lowercase letters.



 
Solution: 

```java
class Solution {
    public boolean canConstruct(String ransomNote, String magazine) {
        int[] freq = new int[26];
        for (int i = 0; i < magazine.length(); i++) {
            freq[magazine.charAt(i) - 'a']++;
        }
        for (int j = 0; j < ransomNote.length(); j++) {
            int index = ransomNote.charAt(j) - 'a';
            freq[index]--;
            if (freq[index] < 0) {
                return false;
            }
        }
        return true;
    }
}
