---
author: "volyx"
title:  "560. Subarray Sum Equals K"
date: "2020-04-28"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "prefix-sum", "repeat"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![560. Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/)

Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.

Example 1:

Input:nums = [1,1,1], k = 2
Output: 2

Note:

- The length of the array is in range [1, 20,000].
- The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].

Hints

```txt
Hide Hint #1  
    Will Brute force work here? Try to optimize it.
Hide Hint #2  
    Can we optimize it by using some extra space?
Hide Hint #3  
    What about storing sum frequencies in a hash table? Will it be useful?
Hide Hint #4  
    sum(i,j)=sum(0,j)-sum(0,i), where sum(i,j) represents the sum of all the elements from index i to j-1. Can we use this property to optimize it.
```

Solution:

```java
class Solution {
    public int subarraySum(int[] nums, int k) {
        Map<Integer, Integer> freq = new HashMap<>();
        int sum = 0;
        int counter = 0;
        freq.put(0, 1);
        for (int i = 0; i < nums.length; i++) {
            sum = sum + nums[i];

            if (freq.containsKey(sum - k)) {
                counter+= freq.get(sum -k);
            }
            freq.put(sum, freq.getOrDefault(sum, 0) + 1);
        }
        return counter;
    }
}

## Solution 14-06-2021

```java
class Solution {
    
    public int subarraySum(int[] nums, int k) {
        Map<Integer, Integer> prefix = new HashMap<>();
        int count = 0;
        int sum = 0;
        prefix.put(0, 1);
        for (int i = 0; i < nums.length; i++) {
            sum += nums[i];
            
            if (prefix.containsKey(sum - k)) {
                count = count + prefix.get(sum - k);
            }
            prefix.put(sum, prefix.getOrDefault(sum, 0) + 1);
        }
        
        return count;
    }

}
```

## Solution 2021-11-20

```java
class Solution {
    public int subarraySum(int[] nums, int k) {
        int n = nums.length;
        int sum = 0;
        Map<Integer, Integer> prefixMap = new HashMap<>();
        int count = 0;
        prefixMap.put(0, 1);
        for (int i = 0; i < n; i++) {
            sum += nums[i];
            if (prefixMap.containsKey(sum - k)) {
                count += prefixMap.get(sum - k);
            }
            prefixMap.put(sum, prefixMap.getOrDefault(sum, 0) + 1);
        }
        
        return count;
    }
}
```
