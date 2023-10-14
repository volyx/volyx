---
author: "volyx"
title:  "215. Kth Largest Element in an Array"
date: "2021-02-24"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "devide and conquer"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/kth-largest-element-in-an-array/]

Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

```txt
Example 1:

Input: [3,2,1,5,6,4] and k = 2
Output: 5

Example 2:

Input: [3,2,3,1,2,4,5,5,6] and k = 4
Output: 4
```

Note:

- You may assume k is always valid, 1 ≤ k ≤ array's length.

```java
class Solution {
    public int findKthLargest(int[] nums, int k) {
        int lo = 0;
        int hi = nums.length - 1;
        k = nums.length - k;
        while (lo < hi) {
            int j = partition(nums, lo, hi);
            if (j < k) {
                lo = j + 1;
            } else if (j > k) {
                hi = j - 1;
            } else {
                return nums[k];
            }
        }
        return nums[k];
    }

    
    int partition(int[] a, int lo, int hi) {
        int i = lo;
        int j = hi + 1;
        
        while (true) {
            
            while (a[++i] < a[lo]) {
                if (i == hi) break;
            }
            
            while (a[lo] < a[--j]) {
                if (j == lo) break;
            }
            
            if (i >= j) break;
            swap(a, i, j);
        }
        swap(a, lo, j);
        return j;
    } 
    
    void swap(int[] a, int i, int j) {
        int temp = a[i];
        a[i] = a[j];
        a[j] = temp;
    }
}
