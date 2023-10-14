---
author: "volyx"
title:  "477. Total Hamming Distance"
date: "2021-05-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "bits"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[477. Total Hamming Distance](https://leetcode.com/problems/total-hamming-distance/)

The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

Given an integer array nums, return the sum of Hamming distances between all the pairs of the integers in nums.

```txt
Example 1:

Input: nums = [4,14,2]
Output: 6
Explanation: In binary representation, the 4 is 0100, 14 is 1110, and 2 is 0010 (just
showing the four bits relevant in this case).
The answer will be:
HammingDistance(4, 14) + HammingDistance(4, 2) + HammingDistance(14, 2) = 2 + 2 + 2 = 6.

Example 2:

Input: nums = [4,14,4]
Output: 4
```

Constraints:

- 1 <= nums.length <= 105
- 0 <= nums[i] <= 109

## Solution

```java
class Solution {
    /*
    0100
    1110
    0010
    ----
    2220
      

    */
    public int totalHammingDistance(int[] nums) {
        int count = 0;
        for (int k = 0; k < 32; k++) {
          int zero = 0;
          int nonZero = 0;
          for (int i = 0; i < nums.length; i++) {
               if ((nums[i] & (1 << k)) > 0) {
                    nonZero++;
               } else {
                   zero++;
               }
          }  
          if (nums.length == zero || nums.length == nonZero) continue;    
          // System.out.println("k bit zero " + zero + " nonZero " + nonZero);  
          
          count += nonZero * zero;  
        }
        return count;
    }
}
```
