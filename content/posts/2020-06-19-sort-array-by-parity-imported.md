---
author: "volyx"
title:  "Sort Array By Parity"
date: "2020-06-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "mock"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.

You may return any answer array that satisfies this condition.

```txt
Example 1:

Input: [3,1,2,4]
Output: [2,4,3,1]
The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
```

Note:

- 1 <= A.length <= 5000
- 0 <= A[i] <= 5000

Solution:

```java
class Solution {
    public int[] sortArrayByParity(int[] A) {
        int n = A.length;
        int i = 0;
        int j = 1;
        while (i < n && j < n) {
            if (A[i] % 2 == 1) {
                j = i + 1;
                while (j < n && A[j] % 2 == 1) {
                    j++;
                }
                if (j == n) {
                    break;
                }
                int c = A[i];
                A[i] = A[j];
                A[j] = c;
            }
            i++;
        }  
        return A;
    }
}
