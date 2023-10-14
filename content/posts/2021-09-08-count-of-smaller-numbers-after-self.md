---
author: "volyx"
title:  "315. Count of Smaller Numbers After Self"
date: "2021-09-08"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "segment-tree", "tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[315. Count of Smaller Numbers After Self](https://leetcode.com/problems/count-of-smaller-numbers-after-self/)

You are given an integer array nums and you have to return a new counts array. The counts array has the property where counts[i] is the number of smaller elements to the right of nums[i].

```txt
Example 1:

Input: nums = [5,2,6,1]
Output: [2,1,1,0]
Explanation:
To the right of 5 there are 2 smaller elements (2 and 1).
To the right of 2 there is only 1 smaller element (1).
To the right of 6 there is 1 smaller element (1).
To the right of 1 there is 0 smaller element.

Example 2:

Input: nums = [-1]
Output: [0]

Example 3:

Input: nums = [-1,-1]
Output: [0,0]
```

Constraints:

- 1 <= nums.length <= 10^5
- -10^4 <= nums[i] <= 10^4

## Solution

```java
class Solution {
    
    /*
    
    -1 -1 5 2 1
    
             0 1 2 3 4 5  
    .. 0...2 0 1 1 0 0 1
    
    
    */
    public List<Integer> countSmaller(int[] nums) {
        int offset = 10_000;
        int size = 2 * 10_000 + 1;
        int[] tree = new int[size * 2];

        List<Integer> res = new ArrayList<>();
        for (int i = nums.length - 1; i >= 0; i--) {
            int smallerCount = query(0, nums[i] + offset, tree, size);
            res.add(0, smallerCount);
            update(nums[i] + offset, 1, tree, size);
        }
        
        return res;
    }
    
    void update(int index, int value, int[] tree, int size) {
        index += size;
        tree[index] += value;
        while (index > 1) {
            index /= 2;
            tree[index] = tree[index * 2] + tree[index * 2 + 1];
        }
    }
    
    int query(int left, int right, int[] tree, int size) {
        int result = 0;
        left += size;
        right += size;
        
        while (left < right) {
            if (left % 2 == 1) {
                result += tree[left];
                left++;
            }
            if (right % 2 == 1) {
                right--;
                result += tree[right];
            }
            
            left /= 2;
            right /= 2;
        }
        
        return result;
    }
}
```
