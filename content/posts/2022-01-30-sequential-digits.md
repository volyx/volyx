---
author: "volyx"
title: "1291. Sequential Digits"
date: "2022-01-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "sliding-window"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![752. Open the Lock](https://leetcode.com/problems/sequential-digits/)

An integer has sequential digits if and only if each digit in the number is one more than the previous digit.

Return a sorted list of all the integers in the range [low, high] inclusive that have sequential digits.

```txt
Example 1:

Input: low = 100, high = 300
Output: [123,234]
```

```txt
Example 2:

Input: low = 1000, high = 13000
Output: [1234,2345,3456,4567,5678,6789,12345]
```

Constraints:

- 10 <= low <= high <= 10^9

## Solution Sliding Window

```java
class Solution {
    public List<Integer> sequentialDigits(int lo, int hi) {
        
        int lenLo = getLen(lo); 
        int lenHi = getLen(hi); 

        int i = lenLo;

        List<Integer> res = new ArrayList<>();
        while (i <= lenHi) {
            res.addAll(buildSeqNums(i, lo, hi));
            i++;
        }
        return res; 
    }

    int getLen(int n) {
        return Integer.toString(n).length();
    }

    String SAMPLE = "123456789";
    List<Integer> buildSeqNums(int n, int lo, int hi) { 

            if (n == 0) return Collections.emptyList();
            int start = 0;
            List<Integer> res = new ArrayList<>();
            while (start + n < SAMPLE.length() + 1) {
                int val = Integer.parseInt(SAMPLE.substring(start, start + n));
                if (val >= lo && val <= hi) {
                    res.add(val);
                }
                start++;
            }
                
            return res;
    }

}
```
