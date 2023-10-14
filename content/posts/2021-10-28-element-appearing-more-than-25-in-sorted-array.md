---
author: "volyx"
title:  "1287. Element Appearing More Than 25% In Sorted Array"
date: "2021-10-28"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "math", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1287. Element Appearing More Than 25% In Sorted Array](https://leetcode.com/problems/element-appearing-more-than-25-in-sorted-array/)

Given an integer array sorted in non-decreasing order, there is exactly one integer in the array that occurs more than 25% of the time, return that integer.

```txt
Example 1:

Input: arr = [1,2,2,6,6,6,6,7,10]
Output: 6

Example 2:

Input: arr = [1,1]
Output: 1
```

Constraints:

- 1 <= arr.length <= 10^4
- 0 <= arr[i] <= 10^5

## Solution

```java
class Solution {
    
    public int findSpecialInteger2(int[] arr) {
        int n = arr.length;
        int val1 = arr[n / 4];
        int val2 = arr[n / 4 * 2] ;  
        int val3 = arr[n / 4 * 3];
        int val4 = arr[n - 1];
        
        int count1 = countFreq(arr, val1);
        int count2 = countFreq(arr, val2);
        int count3 = countFreq(arr, val3);
        int count4 = countFreq(arr, val4);
        
        if (count1 >= count2 && count1 >= count3 && count1 >= count4) {
            return val1;
        }
        
        if (count2 >= count1 && count2 >= count3 && count2 >= count4) {
            return val2;
        }
        
        if (count3 >= count1 && count3 >= count2 && count3 >= count4) {
            return val3;
        } 
        
        return val4;
    }
    
    int countFreq(int[] arr, int val) {
        int mid = Arrays.binarySearch(arr, val);
        int right = mid;
        while (right < arr.length - 1 && arr[right] == arr[right + 1]) {
            right++;
        }
        int left = mid;
        while (left > 0 && arr[left] == arr[left - 1]) {
            left--;
        }
        return right - left;
    }
}
 ```

## Solution 2

 ```java
 class Solution {
    
    public int findSpecialInteger(int[] arr) {
        int n = arr.length;
        int t = n / 4;
        
        for (int i = 0; i < n - t; i++) {
            if (arr[i] == arr[i + t]) {
                return arr[i];
            }
        }
        
        return -1;
    }
}
```
