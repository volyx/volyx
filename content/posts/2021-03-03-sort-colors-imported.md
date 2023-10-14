---
author: "volyx"
title:  "75. Sort Colors"
date: "2021-03-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "sort","repeat"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/sort-colors/]

Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.

We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.

```txt
Example 1:

Input: nums = [2,0,2,1,1,0]
Output: [0,0,1,1,2,2]

Example 2:

Input: nums = [2,0,1]
Output: [0,1,2]

Example 3:

Input: nums = [0]
Output: [0]

Example 4:

Input: nums = [1]
Output: [1]
```

Constraints:

- n == nums.length
- 1 <= n <= 300
- nums[i] is 0, 1, or 2.

Follow up:

- Could you solve this problem without using the library's sort function?
- Could you come up with a one-pass algorithm using only O(1) constant space?

```java
class Solution {
    public void sortColors(int[] nums) {
        int zero = 0;
        int second = nums.length - 1;
        for (int i = 0; i <= second; i++) {
            while (nums[i] == 2 && i < second) swap(nums, i, second--);
            while (nums[i] == 0 && i > zero)  swap(nums, i, zero++);
        }
    }
    
    void swap(int[] a, int i, int j) {
        int temp = a[i];
        a[i] = a[j];
        a[j] = temp;
    }
    
    public void sortColors2(int[] nums) {
        int[] colors = new int[3];
        for (int i = 0; i < nums.length; i++) {
            colors[nums[i]]++;
        }
        int j = 0;
        for (int i = 0; i < colors.length; i++) {
            while (colors[i]-- > 0) {
                nums[j++] = i;
            }
        }
    }
}
```

## Solution 2

```java
class Solution {
    public void sortColors(int[] colors) {
         int c0 = 0; // rightmost boundary of zeros
         int c2 = colors.length - 1; //  the leftmost boundary of twos 
         int curr = 0; // the current element under the consideration.
         while (curr <= c2) {
          if (colors[curr] == 0) {
            swap(c0, curr, colors);
            c0++;
            curr++;   
          } else if (colors[curr] == 1) {
            curr++;
          } else if (colors[curr] == 2) {
            swap(c2, curr, colors);
            c2--;
          }
         }
    }

    
    void swap(int i, int j, int[] array) {
     int temp = array[i];
     array[i] = array[j];
     array[j] = temp;
    }

}
```
