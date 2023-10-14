---
author: "volyx"
title:  "48. Rotate Image"
date: "2021-11-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array", "matrix"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![48. Rotate Image](https://leetcode.com/problems/rotate-image/)

You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

![ex1](/images/2021-11-30-rotate-image-ex1.jpg)

```txt
Example 1:

Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]
```

![ex2](/images/2021-11-30-rotate-image-ex2.jpg)

```txt
Example 2:

Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
```

```txt
Example 3:

Input: matrix = [[1]]
Output: [[1]]
```

```txt
Example 4:

Input: matrix = [[1,2],[3,4]]
Output: [[3,1],[4,2]]
```

Constraints:

- matrix.length == n
- matrix[i].length == n
- 1 <= n <= 20
- -1000 <= matrix[i][j] <= 1000

## Solution BFS (cut inDegree edges)

```java
class Solution {
    public void rotate(int[][] matrix) {
        
        int n = matrix.length;
        int m = matrix[0].length;
        for (int i = 0; i < n; i++) { // transpose (i,j) -> (j,i)
            for (int j = 0; j < m; j++) {
                if (i > j) {
                    swap(i, j, j, i, matrix);
                }
            }
        }
        
        for (int i = 0; i < n; i++) { // reflect left -> right
            for (int j = 0; j < m / 2; j++) {
                swap(i, j, i, m - j - 1, matrix);
            }
        }
    }
    
    void swap(int i1, int j1, int i2, int j2, int[][] matrix) {
        int t = matrix[i1][j1];
        matrix[i1][j1] = matrix[i2][j2];
        matrix[i2][j2] = t;
    }
}
```
