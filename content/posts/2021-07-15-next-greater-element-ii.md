---
author: "volyx"
title:  "503. Next Greater Element II"
date: "2021-07-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[503. Next Greater Element II](https://leetcode.com/problems/next-greater-element-ii/)

Given a circular integer array nums (i.e., the next element of nums[nums.length - 1] is nums[0]), return the next greater number for every element in nums.

The next greater number of a number x is the first greater number to its traversing-order next in the array, which means you could search circularly to find its next greater number. If it doesn't exist, return -1 for this number.

```txt
Example 1:

Input: nums = [1,2,1]
Output: [2,-1,2]
Explanation: The first 1's next greater number is 2; 
The number 2 can't find next greater number. 
The second 1's next greater number needs to search circularly, which is also 2.

Example 2:

Input: nums = [1,2,3,4,3]
Output: [2,3,4,-1,4]
```

Constraints:

- 1 <= nums.length <= 104
- -109 <= nums[i] <= 109

## Solution

```java
class Solution {
    public int[] nextGreaterElements(int[] nums) {
        // monotonic decreasing stack
        int n = nums.length;
        int[] res = new int[n];
        Arrays.fill(res, -1);
        Deque<Integer> stack = new ArrayDeque<>();
        for (int i = 0; i < 2*n; i++) {

            while (!stack.isEmpty() && nums[stack.peek()] < nums[i % n]) {
                res[stack.pop()] = nums[i % n];
            }
            stack.push(i % n);
        }
        return res;
    }
}
```

## Solution 2021-11-20

```java
class Solution {
    public int[] nextGreaterElements(int[] nums) {

        int n = nums.length;
        Stack<Integer> stack = new Stack<>();
        
        int[] res = new int[n];
        Arrays.fill(res, -1);
        
        for (int i = 0; i < 2 * n; i++) {
            int index = i % n;
            while (stack.size() > 0 && nums[stack.peek()] < nums[index]) {
                res[stack.pop()] = nums[index]; 
            }
            stack.push(index);
        }
        
        return res;
    }
}
```
