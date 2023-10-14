---
author: "volyx"
title:  "84. Largest Rectangle in Histogram"
date: "2021-08-17"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "monotonic-stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[84. Largest Rectangle in Histogram](https://leetcode.com/problems/largest-rectangle-in-histogram/)

Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.

```txt
Example 1:

Input: heights = [2,1,5,6,2,3]
Output: 10
Explanation: The above is a histogram where width of each bar is 1.
The largest rectangle is shown in the red area, which has an area = 10 units.
```

![ex1](/images/2021-08-17-ex1.jpg)

```txt
Example 2:

Input: heights = [2,4]
Output: 4
```

![ex2](/images/2021-08-17-ex2.jpg)

Constraints:

- 1 <= heights.length <= 105
- 0 <= heights[i] <= 104

## Solution

```java
class Solution {
    
    public int largestRectangleArea(int[] heights) {
        int max = 0;
        Stack<Integer> posStack = new Stack<>();
        Stack<Integer> heightStack = new Stack<>();
        
        for (int right = 0; right <= heights.length; right++) {
            int rightHeight = (right == heights.length) ? 0: heights[right];
            
            while (posStack.size() > 0 && heightStack.peek() > rightHeight) {
                int left = posStack.pop();
                int leftHeight = heightStack.pop();
                int sideLength = posStack.size() > 0 ? (right - posStack.peek() - 1): right;
                int square = leftHeight * sideLength;
                // System.out.printf("[%d,%d] = %d %n", sideLength, right, square);
                max = Math.max(max, square);
            }
            
            int left = 0;
            int minHeight = rightHeight;
            if (posStack.size() > 0) {
                left = posStack.peek();
                minHeight = heightStack.peek();
            } 
            int square = minHeight * (right - left - 1);
            // System.out.printf("last [%d,%d] = %d %n", left, right, square);
            max = Math.max(max, square);
            
            posStack.push(right);
            heightStack.push(rightHeight);
        }
        return max;
    }
    
    public int largestRectangleArea1(int[] heights) {
        int max = 0;
        Stack<Integer> posStack = new Stack<>();
        Stack<Integer> heightStack = new Stack<>();
        
        for (int i = 0; i <= heights.length; i++) {
            int h = (i == heights.length) ? 0: heights[i];
            
            while (posStack.size() > 0 && heightStack.peek() > h) {
                int left = posStack.pop();
                int leftHeight = heightStack.pop();
                int sideLength = posStack.size() > 0 ? (i - posStack.peek() - 1): i;
                int square = leftHeight * sideLength;
                System.out.printf("[%d,%d] = %d %n", sideLength, i, square);
                max = Math.max(max, square);
            }
            
            posStack.push(i);
            heightStack.push(h);
        }
        while (posStack.size() > 0) {
            int right = posStack.pop();
            int rightHeight = heightStack.pop();
            
            int left = 0;
            int minHeight = rightHeight;
            if (posStack.size() > 0) {
                left = posStack.peek();
                minHeight = heightStack.peek();
            } 
            int square = minHeight * (right - left - 1);
            System.out.printf("last [%d,%d] = %d %n", left, right, square);
            max = Math.max(max, square);
        }
        return max;
    }

     public int largestRectangleArea2(int[] heights) {
        int max = 0;
        for (int i = 0; i < heights.length; i++) {
            for (int j = i; j < heights.length; j++) {
                int minH = heights[i];
                for (int k = i; k <= j; k++) {
                    minH = Math.min(heights[k], minH);
                }
                int square = minH * (j - i + 1);
                // System.out.printf("[%d,%d] = %d %n", i, j, square);
                max = Math.max(max, square);
            }
        }
        
        return max;
    }
    
    public int largestRectangleArea3(int[] heights) {
        int max = 0;
        for (int i = 0; i < heights.length; i++) {
            int h = heights[i];
            int minH = h;
            for (int j = i; j < heights.length; j++) {
                minH = Math.min(heights[j], minH);
                int square = minH * (j - i + 1);
                max = Math.max(max, square);
                System.out.printf("[%d,%d] = %d %n", i, j, square);
            }
        }
        return max;
    }
}


```
