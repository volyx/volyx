---
author: "volyx"
title:  "Sort Colors"
date: "2020-06-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.

Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.

Note: You are not suppose to use the library's sort function for this problem.

Example:
```
Input: [2,0,2,1,1,0]
Output: [0,0,1,1,2,2]
```

Follow up:
- A rather straight forward solution is a two-pass algorithm using counting sort.
- First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
- Could you come up with a one-pass algorithm using only constant space?



Solution:

```java
class Solution {
    public void sortColors(int[] nums) {
        int l = 0;
        int m = 0;
        int h = nums.length - 1;
        
        while (m <= h) {
            if (nums[m] == 0) {
                swap(nums, l, m);
                l++; m++;
            } else if (nums[m] == 1) {
                m++;
            } else if (nums[m] == 2) {
                swap(nums, m, h);
                h--;
            }
        }
    }
    void swap(int[] nums, int i, int j) {
        int c = nums[i];
        nums[i] = nums[j];
        nums[j] = c;
    }
}
