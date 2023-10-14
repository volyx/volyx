---
author: "volyx"
title:  "1213. Intersection of Three Sorted Arrays"
date: "2021-07-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1213. Intersection of Three Sorted Arrays](https://leetcode.com/problems/intersection-of-three-sorted-arrays/)

Given three integer arrays arr1, arr2 and arr3 sorted in strictly increasing order, return a sorted array of only the integers that appeared in all three arrays.

```txt
Example 1:

Input: arr1 = [1,2,3,4,5], arr2 = [1,2,5,7,9], arr3 = [1,3,4,5,8]
Output: [1,5]
Explanation: Only 1 and 5 appeared in the three arrays.

Example 2:

Input: arr1 = [197,418,523,876,1356], arr2 = [501,880,1593,1710,1870], arr3 = [521,682,1337,1395,1764]
Output: []
```

Constraints:

- 1 <= arr1.length, arr2.length, arr3.length <= 1000
- 1 <= arr1[i], arr2[i], arr3[i] <= 2000

## Solution

```java
class Solution {
    
    /* 
    1 2 3 4 
    2 4 5 
    1 3 4 5 
    
    
    */
    
    
     public List<Integer> arraysIntersection(int[] arr1, int[] arr2, int[] arr3) {
         
         int p1 = 0;
         int p2 = 0;
         int p3 = 0;
         
         int n1 = arr1.length;
         int n2 = arr2.length;
         int n3 = arr3.length;
         
         List<Integer> res = new ArrayList<>();
         while (p1 < n1 && p2 < n2 && p3 < n3) {
             
             if (arr1[p1] == arr2[p2] && arr2[p2] == arr3[p3]) {
                 res.add(arr1[p1]);
                 p1++;
                 p2++;
                 p3++;
             } else {
                 if (arr1[p1] < arr2[p2]) {
                     p1++;
                 } else if (arr2[p2] < arr3[p3]) {
                     p2++;
                 } else {
                     p3++;
                 }
                 
             }
         }
         return res;
    }
    
    public List<Integer> arraysIntersection2(int[] arr1, int[] arr2, int[] arr3) {
        int[] freq  = new int[2001];
        
        for (int i = 0; i < arr1.length; i++) {
            freq[arr1[i]]++;
        }
        
        for (int i = 0; i < arr2.length; i++) {
            freq[arr2[i]]++;
        }
        
         for (int i = 0; i < arr3.length; i++) {
            freq[arr3[i]]++;
        }
        
        List<Integer> res = new ArrayList<>();
        
        for (int i = 0; i < freq.length; i++) {
            if (freq[i] == 3) {
                res.add(i);
            }
        }
        
        return res;
    }
}
```
