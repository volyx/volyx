---
author: "volyx"
title:  "1013. Partition Array Into Three Parts With Equal Sum"
date: "2021-06-10"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1013. Partition Array Into Three Parts With Equal Sum](https://leetcode.com/problems/partition-array-into-three-parts-with-equal-sum/)

Given an array of integers arr, return true if we can partition the array into three non-empty parts with equal sums.

Formally, we can partition the array if we can find indexes i + 1 < j with (arr[0] + arr[1] + ... + arr[i] == arr[i + 1] + arr[i + 2] + ... + arr[j - 1] == arr[j] + arr[j + 1] + ... + arr[arr.length - 1])

```txt
Example 1:

Input: arr = [0,2,1,-6,6,-7,9,1,2,0,1]
Output: true
Explanation: 0 + 2 + 1 = -6 + 6 - 7 + 9 + 1 = 2 + 0 + 1

Example 2:

Input: arr = [0,2,1,-6,6,7,9,-1,2,0,1]
Output: false

Example 3:

Input: arr = [3,3,6,5,-2,2,5,1,-9,4]
Output: true
Explanation: 3 + 3 = 6 = 5 - 2 + 2 + 5 + 1 - 9 + 4
```

Constraints:

- 3 <= arr.length <= 5 * 104
- -104 <= arr[i] <= 104

## Solution

```java
class Solution {
    public boolean canThreePartsEqualSum(int[] arr) {
       int sum = 0;
         int n = arr.length;
         for (int i = 0; i < n; i ++) {
            sum += arr[i];
         }

         if (sum % 3 != 0) return false;

         int partSum = sum / 3;

         int i = 0;
         int currentSum = 0;
         int count = 0;
         while (i < n) {
        
        if (count == 2) {
              return true;
        }     
             
         currentSum += arr[i];

         if (currentSum == partSum) {
           count++;
           currentSum = 0; 
         }
             

          i++;
         }

         return false;
    }
}
```
