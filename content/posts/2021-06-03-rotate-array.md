---
author: "volyx"
title:  "189. Rotate Array"
date: "2021-06-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[189. Rotate Array](https://leetcode.com/problems/rotate-array/)

Given an array, rotate the array to the right by k steps, where k is non-negative.

```txt
Example 1:

Input: nums = [1,2,3,4,5,6,7], k = 3
Output: [5,6,7,1,2,3,4]
Explanation:
rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]

Example 2:

Input: nums = [-1,-100,3,99], k = 2
Output: [3,99,-1,-100]
Explanation: 
rotate 1 steps to the right: [99,-1,-100,3]
rotate 2 steps to the right: [3,99,-1,-100]
```

Constraints:

- 1 <= nums.length <= 105
- -231 <= nums[i] <= 231 - 1
- 0 <= k <= 105

Follow up:

- Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
- Could you do it in-place with O(1) extra space?

## Solution

```java
class Solution {

    public void rotate(int[] nums, int k) {
        if (k >= nums.length) {
            k = k % nums.length;
        };
        reverse(nums, 0, nums.length);
        reverse(nums, 0, k);
        reverse(nums, k, nums.length);
    }
    
    void reverse(int[] nums, int l, int r) {
        int j = 0;
        int i = l;
        while (i < l + (r - l) / 2) {
            swap(nums, i, r - j - 1);
            i++;
            j++;
        }
    }
    
    void swap(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
}
```
