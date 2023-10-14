---
author: "volyx"
title:  "340. Longest Substring with At Most K Distinct Characters"
date: "2021-06-23"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "sliding-window"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[340. Longest Substring with At Most K Distinct Characters](https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/)

Given a string s and an integer k, return the length of the longest substring of s that contains at most k distinct characters.

```txt
Example 1:

Input: s = "eceba", k = 2
Output: 3
Explanation: The substring is "ece" with length 3.

Example 2:

Input: s = "aa", k = 1
Output: 2
Explanation: The substring is "aa" with length 2.
```

Constraints:

- 1 <= s.length <= 5 * 104
- 0 <= k <= 50

## Solution

```java
class Solution {
    public int lengthOfLongestSubstringKDistinct(String s, int k) {
        int[] map = new int[128];
        int start = 0;
        int end = 0;
        int maxLen = 0;
        int counter = 0;
        while (end < s.length()) {
            char c = s.charAt(end);
            if (map[c] == 0) counter++;
            map[c]++;
            end++;
            while (counter > k) {
                char prev = s.charAt(start);
                if (map[prev] == 1) counter--;
                map[prev]--;
                start++;
            }
            
             maxLen = Math.max(maxLen, end - start);
        }
        
        return maxLen;
    }
}
```

## Solution 2021-09-07

```java
class Solution {
    /*
    eceba
    01234
    1223
    
    */
    public int lengthOfLongestSubstringKDistinct(String s, int k) {
        int[] freq = new int[256];
        int max = 0;
        int n = s.length();
        int start = 0;
        int end = 0;
        int counter = 0;
        while (end < n) {
            char c = s.charAt(end);
            freq[c]++;
            if (freq[c] == 1) {
                counter++;
            }
            end++;
            while (counter > k) {
                char prev = s.charAt(start);
                freq[prev]--;
                if (freq[prev] == 0) {
                    counter--;
                }
                
                start++;
            }
            max = Math.max(end - start, max);
        }
        
        return max;
    }
}
```

## Solution 2021-11-21

```java
class Solution {
    public int lengthOfLongestSubstringKDistinct(String s, int k) {
        int lo = 0;
        int hi = 0;
        int n = s.length();
        int[] freq = new int[256];
        int count = 0;
        int max = 0;
        while (hi < n) {
            freq[s.charAt(hi)]++;
            if (freq[s.charAt(hi)] == 1) { 
                count++;
            }
            while (count > k) {
                freq[s.charAt(lo)]--;
                if (freq[s.charAt(lo)] == 0) { 
                    count--;
                }
                lo++;
            }
            max = Math.max(max, hi - lo + 1);
            hi++;
        }
        return max;
    }
}
```
