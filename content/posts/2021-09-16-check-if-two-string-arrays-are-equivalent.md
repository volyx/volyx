---
author: "volyx"
title:  "1662. Check If Two String Arrays are Equivalent"
date: "2021-09-16"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1662. Check If Two String Arrays are Equivalent](https://leetcode.com/problems/check-if-two-string-arrays-are-equivalent/)

Given two string arrays word1 and word2, return true if the two arrays represent the same string, and false otherwise.

A string is represented by an array if the array elements concatenated in order forms the string.

```txt
Example 1:

Input: word1 = ["ab", "c"], word2 = ["a", "bc"]
Output: true
Explanation:
word1 represents string "ab" + "c" -> "abc"
word2 represents string "a" + "bc" -> "abc"
The strings are the same, so return true.
```

```txt
Example 2:

Input: word1 = ["a", "cb"], word2 = ["ab", "c"]
Output: false
```

```txt
Example 3:

Input: word1  = ["abc", "d", "defg"], word2 = ["abcddefg"]
Output: true
```

Constraints:

- 1 <= word1.length, word2.length <= 10^3
- 1 <= word1[i].length, word2[i].length <= 10^3
- 1 <= sum(word1[i].length), sum(word2[i].length) <= 103
- word1[i] and word2[i] consist of lowercase letters.

```java
class Solution {
    public boolean arrayStringsAreEqual(String[] word1, String[] word2) {
        int len1 = word1.length;
        int len2 = word2.length;
        
        int part1Index = 0;
        int part2Index = 0;
        int i = 0;
        int j = 0;
        int all1 = countLetters(word1);
        int all2 = countLetters(word2);
        if (all1 != all2) return false;
        int seen1 = 0;
        int seen2 = 0;
        while (part1Index < len1 && part2Index < len2) {
            String w1 = word1[part1Index];
            String w2 = word2[part2Index];
            
            if (i == w1.length()) {
                i = 0;
                part1Index++;
                continue;
            }
            
            if (j == w2.length()) {
                j = 0;
                part2Index++;
                continue;
            }
            
            seen1++;
            seen2++;
            
            if (w1.charAt(i) != w2.charAt(j)) {
                return false;
            } else {
                i++;
                j++;
            }
        }
        
        if (seen1 != all1 || seen2 != all1) return false;
        
        return true;
    }
    
    int countLetters(String[] words) {
        int count = 0;
        for (int i = 0; i< words.length; i++) {
            count += words[i].length();
        }
        return count;
    }
}
```
