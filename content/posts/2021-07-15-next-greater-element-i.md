---
author: "volyx"
title:  "496. Next Greater Element I"
date: "2021-07-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[496. Next Greater Element I](https://leetcode.com/problems/next-greater-element-i/)

The next greater element of some element x in an array is the first greater element that is to the right of x in the same array.

You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2.

For each 0 <= i < nums1.length, find the index j such that nums1[i] == nums2[j] and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is -1.

Return an array ans of length nums1.length such that ans[i] is the next greater element as described above.

```txt
Example 1:

Input: nums1 = [4,1,2], nums2 = [1,3,4,2]
Output: [-1,3,-1]
Explanation: The next greater element for each value of nums1 is as follows:
- 4 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
- 1 is underlined in nums2 = [1,3,4,2]. The next greater element is 3.
- 2 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.

Example 2:

Input: nums1 = [2,4], nums2 = [1,2,3,4]
Output: [3,-1]
Explanation: The next greater element for each value of nums1 is as follows:
- 2 is underlined in nums2 = [1,2,3,4]. The next greater element is 3.
- 4 is underlined in nums2 = [1,2,3,4]. There is no next greater element, so the answer is -1.
```

Constraints:

- 1 <= nums1.length <= nums2.length <= 1000
- 0 <= nums1[i], nums2[i] <= 104
- All integers in nums1 and nums2 are unique.
- All the integers of nums1 also appear in nums2.

## Solution

```java
class Solution {
    
    public int[] nextGreaterElement(int[] findNums, int[] nums) {
        
        Map<Integer, Integer> map = new HashMap<>();
    
        int[] res = new int[findNums.length];  
        
        Deque<Integer> stack = new ArrayDeque<>();
        
        for (int i = 0; i < nums.length; i++) {
           while (!stack.isEmpty() && stack.peek() < nums[i]) {
               map.put(stack.pop(), nums[i]);
           }
           stack.push(nums[i]); 
        }
        
        while (!stack.isEmpty()) {
            map.put(stack.pop(), -1);
        }
        
        for (int i = 0; i < findNums.length; i++) {
            res[i] = map.get(findNums[i]);
        }
        
        return res;
    }
    
    public int[] nextGreaterElement2(int[] nums1, int[] nums2) {
        
        Map<Integer, Integer> valueToIndex = new HashMap<>();
        
        for (int i = 0; i < nums2.length; i++) {
            valueToIndex.put(nums2[i], i);
        }
        
        int[] res = new int[nums1.length];
        Arrays.fill(res, -1);
        
        for (int i = 0; i < nums1.length; i++) {
            Integer index = valueToIndex.get(nums1[i]);
            if (index != null) {
                for (int j = index + 1; j < nums2.length; j++) {
                    if (nums2[j] > nums1[i]) {
                        res[i] = nums2[j];
                        break;
                    }
                }
            }
        }
        return res;
    }
}
```

## Solution 2021-10-22

```java
class Solution {
    public int[] nextGreaterElement(int[] nums1, int[] nums2) {
        Map<Integer, Integer> map = new HashMap<>();
        
        Stack<Integer> stack = new Stack<>();
        // [1,3,4,2]
        // 1 = 3, 3 = 4, 2 = -1
        for (int i = 0; i < nums2.length; i++) {
            while (stack.size() > 0 && stack.peek() < nums2[i]) {
                map.put(stack.pop(), nums2[i]);
            }
            stack.push(nums2[i]);
        }
        
        while (stack.size() > 0) {
            map.put(stack.pop(), -1);
        }
        int[] res = new int[nums1.length];
        for (int i = 0; i < nums1.length; i++) {
            res[i] = map.get(nums1[i]);
        }
        return res;
    }
}
```

## Solution 2021-11-20

```java
class Solution {
    public int[] nextGreaterElement(int[] nums1, int[] nums2) {
        Stack<Integer> stack = new Stack<>();
        
        Map<Integer, Integer> nextGreater = new HashMap<>();
        
        for (int i = 0; i < nums2.length; i++) {
            while (stack.size() > 0 && nums2[stack.peek()] < nums2[i]) {
                nextGreater.put(nums2[stack.pop()], nums2[i]);
            }
            stack.push(i);
        }
        
        int[] res = new int[nums1.length]; 
        for (int i = 0; i < res.length; i++) {
            res[i] = nextGreater.getOrDefault(nums1[i], -1);
        }
        return res;
    }
}
```
