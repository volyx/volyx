---
author: "volyx"
title:  "Longest Substring Without Repeating Characters"
date: "2020-11-07"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a string s, find the length of the longest substring without repeating characters.

Example 1:

```txt
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
```

Example 2:

```txt
Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
```

Example 3:

```txt
Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
```

Example 4:

```txt
Input: s = ""
Output: 0
```

Constraints:

- 0 <= s.length <= 5 * 104
- s consists of English letters, digits, symbols and spaces.


Solution:

```java
class Solution {
    public int lengthOfLongestSubstring(String s) {
        int n = s.length();
        var set = new HashSet<Character>();
        int i = 0;
        int j = 0;
        int ans = 0;
        while (i < n && j < n) {
            // try to extend the range [i, j]
            if (!set.contains(s.charAt(j))) {
                set.add(s.charAt(j));
                j++;
                ans = Math.max(ans, j - i);
            } else {
                set.remove(s.charAt(i)); // important to remove first
                i++;
            }
       }
       return ans;
    }
}
