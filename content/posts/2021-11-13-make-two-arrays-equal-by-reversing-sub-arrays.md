---
author: "volyx"
title: "Pair Sums"
date: "2021-11-13"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1460. Make Two Arrays Equal by Reversing Sub-arrays](https://leetcode.com/problems/make-two-arrays-equal-by-reversing-sub-arrays/)

Given two integer arrays of equal length target and arr.

In one step, you can select any non-empty sub-array of arr and reverse it. You are allowed to make any number of steps.

Return True if you can make arr equal to target, or False otherwise.

```txt
Example 1:

Input: target = [1,2,3,4], arr = [2,4,1,3]
Output: true
Explanation: You can follow the next steps to convert arr to target:
1- Reverse sub-array [2,4,1], arr becomes [1,4,2,3]
2- Reverse sub-array [4,2], arr becomes [1,2,4,3]
3- Reverse sub-array [4,3], arr becomes [1,2,3,4]
There are multiple ways to convert arr to target, this is not the only way to do so.

Example 2:

Input: target = [7], arr = [7]
Output: true
Explanation: arr is equal to target without any reverses.

Example 3:

Input: target = [1,12], arr = [12,1]
Output: true

Example 4:

Input: target = [3,7,9], arr = [3,7,11]
Output: false
Explanation: arr doesn't have value 9 and it can never be converted to target.

Example 5:

Input: target = [1,1,1,1,1], arr = [1,1,1,1,1]
Output: true
```

Constraints:

- target.length == arr.length
- 1 <= target.length <= 1000
- 1 <= target[i] <= 1000
- 1 <= arr[i] <= 1000

## Solution

```java
class Solution {
    public boolean canBeEqual(int[] array_a, int[] array_b) {
        if (array_a.length != array_b.length) {
          return false;
        }
        int n = array_a.length;

        int[] freq1 = new int[1_001];
        int[] freq2 = new int[1_001];

        for (int i = 0; i < n; i++) {
          freq1[array_a[i]]++;
          freq2[array_b[i]]++;
        }

        return Arrays.equals(freq1, freq2);
    }
}
 ```
