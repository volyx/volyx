---
author: "volyx"
title:  "Single Element in a Sorted Array"
date: "2020-05-29"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once. Find this single element that appears only once.

Follow up: Your solution should run in O(log n) time and O(1) space.


Example 1:

```
Input: nums = [1,1,2,3,3,4,4,8,8]
Output: 2
```

Example 2:
```
Input: nums = [3,3,7,7,10,11,11]
Output: 10
```
 
Constraints:

- 1 <= nums.length <= 10^5
- 0 <= nums[i] <= 10^5


Solution: 

```java
class Solution {
    public int singleNonDuplicate(int[] nums) {
        int l = 0;
        int r = nums.length - 1;
        while (l < r) {
            int mid = l + (r - l) / 2;
            boolean isEven = (r - mid) % 2 == 0;
            if (nums[mid] == nums[mid - 1]) {
                if (isEven) {
                     r = mid - 2;
                } else {
                     l = mid + 1;
                }
            } else if (nums[mid] == nums[mid + 1]) {
                if (isEven) {
                   l = mid + 2;
                } else {
                    r = mid - 1;
                }
            } else {
                return nums[mid];
            }
        }
        return nums[l];
    }
}
