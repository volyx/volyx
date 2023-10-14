---
author: "volyx"
title:  "Sort Array By Parity II"
date: "2020-06-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given an array A of non-negative integers, half of the integers in A are odd, and half of the integers are even.

Sort the array so that whenever A[i] is odd, i is odd; and whenever A[i] is even, i is even.

You may return any answer array that satisfies this condition.


Example 1:
```
Input: [4,2,5,7]
Output: [4,5,2,7]
Explanation: [4,7,2,5], [2,5,4,7], [2,7,4,5] would also have been accepted.
```
 
Note:
- 2 <= A.length <= 20000
- A.length % 2 == 0
- 0 <= A[i] <= 1000

Solution:

```java
class Solution {
    public int[] sortArrayByParityII(int[] A) {
        int n = A.length;
        int i = 0; int j = 1;
        while (i < n) {
            if (A[i] % 2 == 1) {
                while (A[j] % 2 == 1) {
                    j = j + 2;
                }
                int c = A[i];
                A[i] = A[j];
                A[j] = c;
            }
            i = i + 2;
        }
        return A;
    }
}
