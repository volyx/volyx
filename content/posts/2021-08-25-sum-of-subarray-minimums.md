---
author: "volyx"
title:  "907. Sum of Subarray Minimums"
date: "2021-08-25"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "monotonic-stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[907. Sum of Subarray Minimums](https://leetcode.com/problems/sum-of-subarray-minimums/)

Given an array of integers arr, find the sum of min(b), where b ranges over every (contiguous) subarray of arr. Since the answer may be large, return the answer modulo 109 + 7.

```txt
Example 1:

Input: arr = [3,1,2,4]
Output: 17
Explanation: 
Subarrays are [3], [1], [2], [4], [3,1], [1,2], [2,4], [3,1,2], [1,2,4], [3,1,2,4]. 
Minimums are 3, 1, 2, 4, 1, 1, 2, 1, 1, 1.
Sum is 17.

Example 2:

Input: arr = [11,81,94,43,3]
Output: 444
```

Constraints:

- 1 <= arr.length <= 3 * 10^4
- 1 <= arr[i] <= 3 * 10^4

## Solution

```java
class Solution {
    public int sumSubarrayMins(int[] arr) {
        // increasing stack
        Stack<Integer> prevLess = new Stack<>();
        Stack<Integer> nextLess = new Stack<>();
        
        int[] left = new int[arr.length];
        int[] right = new int[arr.length];
        
        for (int i = 0; i < arr.length; i++) {
            while (prevLess.size() > 0 && arr[i] <= arr[prevLess.peek()]) {
                prevLess.pop();
            }
            left[i] = prevLess.size() == 0 ? i + 1: i - prevLess.peek();
            prevLess.push(i);
        }
        
        for (int i = arr.length - 1; i >=0; i--) {
            while (nextLess.size() > 0 && arr[i] < arr[nextLess.peek()]) {
                nextLess.pop();
            }
            right[i] = nextLess.size() == 0 ? arr.length - i:  nextLess.peek() - i;
            nextLess.push(i);
        }
        long MOD = (long) 1e9 + 7;
        long res = 0;
        for (int i = 0; i < arr.length; i++) {
            res = (res + (long)arr[i] * left[i] * right[i]) % MOD;
        }
        return (int) res;
    }
}
```
