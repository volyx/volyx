---
author: "volyx"
title:  "287. Find the Duplicate Number"
date: "2021-07-24"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array", "cycle"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[287. Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number/)

Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.

There is only one repeated number in nums, return this repeated number.

You must solve the problem without modifying the array nums and uses only constant extra space.

```txt
Example 1:

Input: nums = [1,3,4,2,2]
Output: 2

Example 2:

Input: nums = [3,1,3,4,2]
Output: 3

Example 3:

Input: nums = [1,1]
Output: 1

Example 4:

Input: nums = [1,1,2]
Output: 1
```

Constraints:

- 1 <= n <= 105
- nums.length == n + 1
- 1 <= nums[i] <= n
- All the integers in nums appear only once except for precisely one integer which appears two or more times.

Follow up:

- How can we prove that at least one duplicate number must exist in nums?
- Can you solve the problem in linear runtime complexity?

## Solution

```java
class Solution {
    
    
     /*
     [0,1,2,3,4]
     [3,1,3,4,2]
     
     slow: 3 4 2
     fast: 3 23 4
     
                        xxxxxxxx
                      xxx      xx
                     xx         xx
    xxxxxxxxxxxxxxxxxx           x
                     xx          x
                      xxxx     xxx
                         xxxxxxx
     */

    
    
    
    public int findDuplicate(int[] nums) {
        int fast = nums[0];
        int slow = nums[0];
        
        do {
            slow = nums[slow];
            fast = nums[nums[fast]];
        } while (slow != fast);

        slow = nums[0];
        
        while (slow != fast) {
            slow = nums[slow];
            fast = nums[fast];
        }
        
        return fast;
    }
    
     public int findDuplicate1(int[] nums) {
         
        int duplicate = -1;
        
        for (int i = 0; i < nums.length; i++) {
             int curr = Math.abs(nums[i]);
             
             if (nums[curr] < 0) {
                 duplicate = curr;
             }
             
             nums[curr] *= -1;
         }
         
         for (int i = 0; i < nums.length; i++) {
             nums[i] = Math.abs(nums[i]);
         }
         
         return duplicate;
     }    
}
```