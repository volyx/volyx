---
author: "volyx"
title:  "1207. Unique Number of Occurrences"
date: "2021-05-09"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1207. Unique Number of Occurrences](https://leetcode.com/problems/unique-number-of-occurrences/)

Given an array of integers arr, write a function that returns true if and only if the number of occurrences of each value in the array is unique.

```txt
Example 1:

Input: arr = [1,2,2,1,1,3]
Output: true
Explanation: The value 1 has 3 occurrences, 2 has 2 and 3 has 1. No two values have the same number of occurrences.
```

```txt
Example 2:

Input: arr = [1,2]
Output: false
```

```txt
Example 3:

Input: arr = [-3,0,1,-3,1,1,1,-3,10,0]
Output: true
```

Constraints:

- 1 <= arr.length <= 1000
- -1000 <= arr[i] <= 1000

## Solution

```java
class Solution {
    public boolean uniqueOccurrences(int[] arr) {
        int[] freq = new int[2001];
        
        for (int i = 0; i < arr.length; i++) {
            freq[arr[i] + 1000]++;
        }
        Set<Integer> set = new HashSet<>();
        for (int i = 0; i < freq.length; i++) {
            if (freq[i] > 0) {
               boolean prev = set.add(freq[i]);
                if (!prev) {
                    return false;
                }
            }        }
        return true;
    }
}
```
