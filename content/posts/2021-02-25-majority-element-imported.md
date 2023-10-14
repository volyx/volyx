---
author: "volyx"
title:  "169. Majority Element"
date: "2021-02-25"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "devide and conquer"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/majority-element/]

Given an array nums of size n, return the majority element.

The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

```txt
Example 1:

Input: nums = [3,2,3]
Output: 3

Example 2:

Input: nums = [2,2,1,1,1,2,2]
Output: 2
```

Constraints:

- n == nums.length
- 1 <= n <= 5 * 104
- -231 <= nums[i] <= 231 - 1

 Follow-up: Could you solve the problem in linear time and in O(1) space?

```java
class Solution {
    private static final Random RANDOM = new Random();
    
    public int majorityElement(int[] nums) {
        sort(nums);
        return nums[nums.length / 2];
    }

    void sort(int[] nums) {
        shuffle(nums);
    	sort(nums, 0, nums.length - 1);
    }

    void sort(int[] nums, int lo, int hi) {
    	if (hi <= lo) return;
    	int j = partition(nums, lo, hi);
    	sort(nums, lo, j - 1);
    	sort(nums, j + 1, hi);
    }
    
    void shuffle(int[] a) {
        for (int i = 0; i < a.length; i++) {
            swap(a, i, RANDOM.nextInt(a.length));
        }
    }

    int partition(int[] a, int lo, int hi) {
    	int i = lo;
    	int j = hi + 1; 
    	while(true) {
            
    		while (a[++i] < a[lo]) {
    			if (i == hi) break;
    		}

    		while (a[lo] < a[--j]) {
    			if (j == lo) break;
    		}
            
    		if (j <= i) break;
    		swap(a, i, j);
    	}
    	swap(a, lo, j);
    	return j;
    }
    
    void swap(int[] a, int i, int j) {
        int temp = a[i];
        a[i] = a[j];
        a[j] = temp;
    }
}
