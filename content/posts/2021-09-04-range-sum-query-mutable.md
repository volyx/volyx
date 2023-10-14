---
author: "volyx"
title:  "307. Range Sum Query - Mutable"
date: "2021-09-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "tree", "segment-tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[307. Range Sum Query - Mutable](https://leetcode.com/problems/range-sum-query-mutable/)

Given an integer array nums, handle multiple queries of the following types:

- Update the value of an element in nums.
- Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.

Implement the NumArray class:

- NumArray(int[] nums) Initializes the object with the integer array nums.
- void update(int index, int val) Updates the value of nums[index] to be val.
- int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).

```txt
Example 1:

Input
["NumArray", "sumRange", "update", "sumRange"]
[[[1, 3, 5]], [0, 2], [1, 2], [0, 2]]
Output
[null, 9, null, 8]

Explanation
NumArray numArray = new NumArray([1, 3, 5]);
numArray.sumRange(0, 2); // return 1 + 3 + 5 = 9
numArray.update(1, 2);   // nums = [1, 2, 5]
numArray.sumRange(0, 2); // return 1 + 2 + 5 = 8
```

Constraints:

- 1 <= nums.length <= 3 * 104
- -100 <= nums[i] <= 100
- 0 <= index < nums.length
- -100 <= val <= 100
- 0 <= left <= right < nums.length
- At most 3 * 104 calls will be made to update and sumRange.

## Solution

```java
class NumArray {
    int[] nums;
    int[] tree;
    int n;
    
    /*
     0,1,2,3,4,5 
    [x,x,8,1,3,5]
    
    
     9
   1   8
  0 1 3 5
    
    */
    public NumArray(int[] nums) {
        this.n = nums.length;
        this.nums = nums;
        this.tree = new int[2 * n];
        
        for (int i = 0; i < n; i++) {
            tree[n + i] = nums[i];
        }
        
        for (int i = n - 1; i > 0; i--) {
            tree[i] = tree[i * 2] + tree[2 * i + 1];
        }
        
        // System.out.println(Arrays.toString(nums));
        // System.out.println(Arrays.toString(tree));
    }
    
    public void update(int index, int val) {
        nums[index] = val;
        index += n;
        tree[index] = val;
        while (index > 0) {
            int left = index;
            int right = index;
            
            if (index % 2 == 0) {
                right = index + 1;
            } else {
                left = index - 1;
            }
            tree[index / 2] = tree[left] + tree[right];
            index = index / 2;
        }
        // System.out.println(Arrays.toString(nums));
        // System.out.println(Arrays.toString(tree));
    }
    
    public int sumRange(int left, int right) {
        left += n;
        right += n;
        int sum = 0;
        
        while (left <= right) {
            if (left % 2 == 1) {
                sum += tree[left];
                left++;
                continue;
            }
            
            if (right % 2 == 0) {
                sum += tree[right];
                right--;
                continue;
            }
            
            right /= 2;
            left /= 2;
        }
        return sum;
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray obj = new NumArray(nums);
 * obj.update(index,val);
 * int param_2 = obj.sumRange(left,right);
 */
```
