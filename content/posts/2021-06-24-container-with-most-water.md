---
author: "volyx"
title:  "11. Container With Most Water"
date: "2021-06-24"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium","two-pointers"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[11. Container With Most Water](https://leetcode.com/problems/container-with-most-water/)

Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of the line i is at (i, ai) and (i, 0). Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.

Notice that you may not slant the container.

```txt
Example 1:

Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
```

![ex1](/images/2021-06-24-ex1.jpg)

```txt
Example 2:

Input: height = [1,1]
Output: 1

Example 3:

Input: height = [4,3,2,1,4]
Output: 16

Example 4:

Input: height = [1,2,1]
Output: 2
```

Constraints:

- n == height.length
- 2 <= n <= 10^5
- 0 <= height[i] <= 10^4
  
## Solution

```java
class Solution {
    public int maxArea(int[] height) {
        int l = 0; 
        int r = height.length - 1;
        int maxarea = 0;
        while (l < r) {
            int minHeight = Math.min(height[l], height[r]);
            maxarea = Math.max(maxarea, minHeight * (r - l));
            
            if (height[l] < height[r]) {
                l++;
            } else {
                r--;
            }
        }
        return maxarea;
    }
}
```
