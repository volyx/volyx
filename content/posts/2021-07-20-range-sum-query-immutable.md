---
author: "volyx"
title:  "303. Range Sum Query - Immutable"
date: "2021-07-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "prefix-sum"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[303. Range Sum Query - Immutable](https://leetcode.com/problems/range-sum-query-immutable/)

Given an integer array nums, handle multiple queries of the following type:

- Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.

Implement the NumArray class:

- NumArray(int[] nums) Initializes the object with the integer array nums.
- int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).

```txt
Example 1:

Input
["NumArray", "sumRange", "sumRange", "sumRange"]
[[[-2, 0, 3, -5, 2, -1]], [0, 2], [2, 5], [0, 5]]
Output
[null, 1, -1, -3]

Explanation
NumArray numArray = new NumArray([-2, 0, 3, -5, 2, -1]);
numArray.sumRange(0, 2); // return (-2) + 0 + 3 = 1
numArray.sumRange(2, 5); // return 3 + (-5) + 2 + (-1) = -1
numArray.sumRange(0, 5); // return (-2) + 0 + 3 + (-5) + 2 + (-1) = -3
```

Constraints:

- 1 <= nums.length <= 10^4
- -10^5 <= nums[i] <= 10^5
- 0 <= left <= right < nums.length
- At most 10^4 calls will be made to sumRange.

## Solution

```java
class NumArray {
    
    int[] prefix;
    /*
    [-2, 0, 3, -5, 2, -1]
    [-2,-2, 1, -4,-2, -3]
    [0, 2] 1  === 1 -- 2
    [2, 5] -1 === -3
    [0, 5] -3
    
    */
    public NumArray(int[] nums) {
        prefix = new int[nums.length];
        int sum = 0;
        for (int i = 0; i < nums.length; i++) {
            sum += nums[i];
            prefix[i] = sum;
        }
    }
    
    public int sumRange(int left, int right) {
        if (left == 0) {
            return prefix[right];
        }
        
        return prefix[right] - prefix[left - 1];
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray obj = new NumArray(nums);
 * int param_1 = obj.sumRange(left,right);
 */
```

## Solution 2021-08-21

```java
class NumArray {
    
    int[] prefix;

    public NumArray(int[] nums) {
        this.prefix = new int[nums.length];
        
        /*
        -2 0 3 -5 2 -1
        
        -2 -2 1 -4 -2 -3
        
        [2,5] = -3 - (1) = -4
        
        
        */
        
        for (int i = 0; i < nums.length; i++) {
            if (i > 0) {
                prefix[i] = prefix[i - 1] + nums[i];
            } else {
                prefix[i] = nums[i];
            }   
        }
        // System.out.println(Arrays.toString(prefix));
    }
    
    public int sumRange(int left, int right) {
        if (left == 0) return prefix[right];
        return prefix[right] - prefix[left - 1];
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray obj = new NumArray(nums);
 * int param_1 = obj.sumRange(left,right);
 */
```
