---
author: "volyx"
title:  "1852. Distinct Numbers in Each Subarray"
date: "2021-05-27"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "sliding-window", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1852. Distinct Numbers in Each Subarray](https://leetcode.com/problems/distinct-numbers-in-each-subarray/)

Given an integer array nums and an integer k, you are asked to construct the array ans of size n-k+1 where ans[i] is the number of distinct numbers in the subarray nums[i:i+k-1] = [nums[i], nums[i+1], ..., nums[i+k-1]].

Return the array ans.

```txt
Example 1:

Input: nums = [1,2,3,2,2,1,3], k = 3
Output: [3,2,2,2,3]
Explanation: The number of distinct elements in each subarray goes as follows:
- nums[0:2] = [1,2,3] so ans[0] = 3
- nums[1:3] = [2,3,2] so ans[1] = 2
- nums[2:4] = [3,2,2] so ans[2] = 2
- nums[3:5] = [2,2,1] so ans[3] = 2
- nums[4:6] = [2,1,3] so ans[4] = 3

Example 2:

Input: nums = [1,1,1,1,2,3,4], k = 4
Output: [1,2,3,4]
Explanation: The number of distinct elements in each subarray goes as follows:
- nums[0:3] = [1,1,1,1] so ans[0] = 1
- nums[1:4] = [1,1,1,2] so ans[1] = 2
- nums[2:5] = [1,1,2,3] so ans[2] = 3
- nums[3:6] = [1,2,3,4] so ans[3] = 4
```

Constraints:

- 1 <= k <= nums.length <= 105
- 1 <= nums[i] <= 105

## Solution

```java
class Solution {
    // [1,2,3,3] k = 3
    public int[] distinctNumbers(int[] nums, int k) {
        int n = nums.length;
        int[] ans = new int[n - k + 1];
        int j = 0;        
        Map<Integer, Integer> freq = new HashMap<Integer, Integer>();
        for (int i = 0; i < n; i++) {
        if (i < k - 1) {
          freq.put(nums[i], freq.getOrDefault(nums[i], 0) + 1);
        } else if (i == k - 1) {
                freq.put(nums[i], freq.getOrDefault(nums[i], 0) + 1);
                ans[j] = freq.size();
                j++; 
        } else {
                int prevNum = nums[i - k];
                Integer prevFreq = freq.get(prevNum);
                if (prevFreq == 1) {
                    freq.remove(prevNum);
                } else {
                    freq.put(prevNum, prevFreq - 1);
                }
                freq.put(nums[i], freq.getOrDefault(nums[i], 0) + 1);
                ans[j] = freq.size();
                j++; 
         }
        }
        return ans;
    }
}
```
