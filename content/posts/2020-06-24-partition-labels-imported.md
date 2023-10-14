---
author: "volyx"
title:  "763. Partition Labels"
date: "2020-06-24"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "string", "two-pointers"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![763. Partition Labels](https://leetcode.com/problems/partition-labels/)

A string s of lowercase English letters is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts.

```txt
Example 1:

Input: s = "ababcbacadefegdehijhklij"
Output: [9,7,8]
Explanation:
The partition is "ababcbaca", "defegde", "hijhklij".
This is a partition so that each letter appears in at most one part.
A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits s into less parts.
```

Note:

- s will have length in range [1, 500].
- s will consist of lowercase English letters ('a' to 'z') only.

## Solution

```java
class Solution {
    public List<Integer> partitionLabels(String s) {
        int[] last = new int[26];
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            last[c - 'a'] = Math.max(i, last[c - 'a']);
        }
        int i = 0;
        int j = 0;
        int count = 0;
        List<Integer> res = new ArrayList<>();
        while (i < s.length()) {
            char c = s.charAt(i);
            count++;
            j = Math.max(last[c - 'a'], j);
            if (i == j) {
                res.add(count);
                count = 0;
            }
            i++;
        }
        return res;
    }
}
```

## Solution 2021-10-14

```java
class Solution {
    public List<Integer> partitionLabels(String s) {
        if (s.length() == 0) return Collections.emptyList();

        int[] rightMostIndexes = new int[26]; // O(C)

        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            rightMostIndexes[c - 'a'] = Math.max(rightMostIndexes[c - 'a'], i);
        }

        List<Integer> parts = new ArrayList<>(); // O(C)
        int currentRightMostIndex = 0;
        int left = 0; // 4
        for (int i = 0; i < s.length(); i++) { // i = 4
            char c = s.charAt(i);
            currentRightMostIndex = Math.max(rightMostIndexes[c - 'a'], currentRightMostIndex);     
            if (i == currentRightMostIndex) {
                parts.add(currentRightMostIndex - left + 1);
                left = i + 1;
            }
        }
        return parts;

    }
}
```
