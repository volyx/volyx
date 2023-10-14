---
author: "volyx"
title:  "Max consecutive ones III"
date: "2020-06-23"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given an array A of 0s and 1s, we may change up to K values from 0 to 1.

Return the length of the longest (contiguous) subarray that contains only 1s. 

Example 1:
```
Input: A = [1,1,1,0,0,0,1,1,1,1,0], K = 2
Output: 6
Explanation: 
[1,1,1,0,0,1,1,1,1,1,1]
Bolded numbers were flipped from 0 to 1.  The longest subarray is underlined.
```

Example 2:
```
Input: A = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], K = 3
Output: 10
Explanation: 
[0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
Bolded numbers were flipped from 0 to 1.  The longest subarray is underlined.
```
 
Note:
- 1 <= A.length <= 20000
- 0 <= K <= A.length
- A[i] is 0 or 1 


Solution:

```java
class Solution {
    public int longestOnes(int[] A, int K) {
        int i = 0;
        int j = 0;
        while (i < A.length) {
            if (A[i] == 0) {
                K--;
            }
            if (K < 0) {
                if (A[j] == 0) {
                    K++;
                }
                j++;
            }
            i++;
        }
        return i - j;
    }
}
