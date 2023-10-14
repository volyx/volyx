---
author: "volyx"
title:  "325. Maximum Size Subarray Sum Equals k"
date: "2021-07-16"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array", "fb"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[325. Maximum Size Subarray Sum Equals k](https://leetcode.com/problems/maximum-size-subarray-sum-equals-k/)

Given an integer array nums and an integer k, return the maximum length of a subarray that sums to k. If there isn't one, return 0 instead.

```txt
Example 1:

Input: nums = [1,-1,5,-2,3], k = 3
Output: 4
Explanation: The subarray [1, -1, 5, -2] sums to 3 and is the longest.

Example 2:

Input: nums = [-2,-1,2,1], k = 1
Output: 2
Explanation: The subarray [-1, 2] sums to 1 and is the longest.
```

Constraints:

- 1 <= nums.length <= 2 * 105
- -104 <= nums[i] <= 104
- -109 <= k <= 109

## Solution

```java
class Solution {
    /*
    
    1 -1 5 -2 3
    1  0 5  3 6
    
    
    */
    
    public int maxSubArrayLen(int[] nums, int k) {
        Map<Integer, Integer> map = new HashMap<>();
        map.put(0, -1);
        int max = 0;
        int sum = 0;
        for (int i = 0; i < nums.length; i++) {
            sum += nums[i];
            Integer prev = map.get(sum - k);
            if (prev != null) {
                max = Math.max(max, i - prev);
            }
            map.putIfAbsent(sum, i);
        }
        
        return max;
    }
}
```

## Solution 2021-11-23

```java
class Solution {
    public int maxSubArrayLen(int[] nums, int k) {
        int n = nums.length;
        Map<Integer, Integer> prefix = new HashMap<>();
        int sum = 0;
        int maxLen = 0;
        for (int i = 0; i < n; i++) {
            sum += nums[i];
            if (sum == k) {
                maxLen = i + 1;
            }
            if (prefix.containsKey(sum - k)) {
                maxLen = Math.max(maxLen, i - prefix.get(sum - k));
            }
            if (!prefix.containsKey(sum))
                prefix.put(sum, i);
        }
        return maxLen;
    }
}
```
