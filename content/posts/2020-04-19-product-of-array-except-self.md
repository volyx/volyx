---
author: "volyx"
title:  "Product of Array Except Self"
date: "2020-04-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

```txt
Example:

Input:  [1,2,3,4]
Output: [24,12,8,6]
```

Constraint: It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.

Note: Please solve it without division and in O(n).

Follow up:
Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)

```txt
Notes:

    [a,b,c,d,e]
    
    [bcde, acde, abed, abce, abcd]
    
    [1,    a,   ab, abc, abcd]
    [bcde, cde, de, e,   1]
```

```java
class Solution {

    public int[] productExceptSelf(int[] nums) {

        int n = nums.length;
        int[] leftProduct = new int[n];
        int[] rightProduct = new int[n];
        int[] result = new int[n];

        leftProduct[0] = 1;
        for (int i = 1; i < n; i++) {
            leftProduct[i] = leftProduct[i - 1] * nums[i - 1]; 
        }

        rightProduct[n - 1] = 1;
        for (int i = n - 1; i > 0; i--) {
            rightProduct[i - 1] = rightProduct[i] * nums[i];
        }

        for (int i = 0; i < n; i++) {
            result[i] = leftProduct[i] * rightProduct[i];
        }

        return result;
    }
}
```

## Solution 2021-11-21

```java
class Solution {
    public int[] productExceptSelf(int[] nums) {
        int n = nums.length;
        int[] p1 = new int[n];
        int[] p2 = new int[n];
        Arrays.fill(p1, 1);
        Arrays.fill(p2, 1);
        
        for (int i = 1; i < n; i++) {
            p1[i] = nums[i - 1];
            p1[i] *= p1[i - 1];
        }
  
        for (int i = n - 1; i > 0; i--) {
            p2[i - 1] = nums[i];
            p2[i - 1] *= p2[i];
        }
        
        for (int i = 0; i < n; i++) {
            nums[i] = p1[i] * p2[i];
        }
        
        return nums;
    }
}
```

## Solution 2022-01-24

```java
class Solution {
    /*
    Input: nums = [1,2,3,4]
    Output: [24,12,8,6]
    
    
    1*2*3*4, 1*3*4, 1*2*4, 1*2*3
    
    [1, 1, 2, 3] = [ 1, 1, 2,6]
    [2, 3, 4, 1] = [24,12, 4, 1]
    
    
*/

    public int[] productExceptSelf(int[] nums) {
        int n = nums.length;
        int[] p1 = new int[n];
        p1[0] = 1;
        for (int i = 1; i < n; i++) {
            p1[i] = nums[i - 1] * p1[i - 1];
        }
        int[] p2 = new int[n];
        p2[n - 1] = 1;
        for (int i = n - 2; i >= 0; i--) {
            p2[i] = p2[i + 1] * nums[i + 1];
        }
        int[] p = new int[n];
        for (int i = 0; i < n; i++) {
            p[i] = p1[i] * p2[i];
        }
        return p;
    }
}
```