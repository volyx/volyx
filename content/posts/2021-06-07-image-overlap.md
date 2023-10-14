---
author: "volyx"
title:  "835. Image Overlap"
date: "2021-06-07"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array","matrix"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[835. Image Overlap](https://leetcode.com/problems/image-overlap)

You are given two images img1 and img2 both of size n x n, represented as binary, square matrices of the same size. (A binary matrix has only 0s and 1s as values.)

We translate one image however we choose (sliding it left, right, up, or down any number of units), and place it on top of the other image.  After, the overlap of this translation is the number of positions that have a 1 in both images.

(Note also that a translation does not include any kind of rotation.)

What is the largest possible overlap?

```txt
Example 1:

Input: img1 = [[1,1,0],[0,1,0],[0,1,0]], img2 = [[0,0,0],[0,1,1],[0,0,1]]
Output: 3
Explanation: We slide img1 to right by 1 unit and down by 1 unit.

The number of positions that have a 1 in both images is 3. (Shown in red)
```

![ex1](/images/2021-06-07-ex1.jpg)

```txt
Example 2:

Input: img1 = [[1]], img2 = [[1]]
Output: 1
```

![ex2](/images/2021-06-07-ex2.jpg)

```txt
Example 3:

Input: img1 = [[0]], img2 = [[0]]
Output: 0
```

![ex3](/images/2021-06-07-ex3.jpg)

Constraints:

- n == img1.length
- n == img1[i].length
- n == img2.length
- n == img2[i].length
- 1 <= n <= 30
- img1[i][j] is 0 or 1.
- img2[i][j] is 0 or 1.

## Solution

```java
class Solution {
    
    /*
    
    [[0,0,0,0,1],
     [0,0,0,0,0],
     [0,0,0,0,0],
     [0,0,0,0,0],
     [0,0,0,0,0]]
     
    [[0,0,0,0,0],
     [0,0,0,0,0],
     [0,0,0,0,0],
     [0,0,0,0,0],
     [1,0,0,0,0]]
     
    */
    
    public int largestOverlap(int[][] img1, int[][] img2) {
        int n = img1.length;
        int max = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                max = Math.max(max, intersectRightBottom(i, j, img1, img2));
                max = Math.max(max, intersectRightBottom(i, j, img2, img1));
            }
        }
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                max = Math.max(max, intersectLeftBottom(i, j, img1, img2));
                max = Math.max(max, intersectLeftBottom(i, j, img2, img1));
            }
        }
        return max;
    }
    
        
    int intersectLeftBottom(int row, int col, int[][] img1, int[][] img2) {
        int count = 0;
        int n = img1.length;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i + row < n && 
                    j - col >= 0 &&
                    img2[i + row][j - col] == img1[i][j] &&
                    img1[i][j] == 1) {
                    count++;
                }
            }
        }
        return count;
    }
    
    int intersectRightBottom(int row, int col, int[][] img1, int[][] img2) {
        int count = 0;
        int n = img1.length;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i + row < n && 
                    j + col < n &&
                    img2[i + row][j + col] == img1[i][j] &&
                    img1[i][j] == 1) {
                    count++;
                }
            }
        }
        return count;
    }
}
```
