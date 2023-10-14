---
author: "volyx"
title:  "240. Search a 2D Matrix II"
date: "2021-07-06"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "binary-search"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[240. Search a 2D Matrix II](https://leetcode.com/problems/search-a-2d-matrix-ii/)

Write an efficient algorithm that searches for a target value in an m x n integer matrix. The matrix has the following properties:

- Integers in each row are sorted in ascending from left to right.
- Integers in each column are sorted in ascending from top to bottom.

```txt
Example 1:

Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
Output: true
```

![ex1](/images/2021-07-06-search-matrix-ii-ex1.jpg)

```txt
Example 2:

Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
Output: false
```

![ex2](/images/2021-07-06-search-matrix-ii-ex2.jpg)

Constraints:

- m == matrix.length
- n == matrix[i].length
- 1 <= n, m <= 300
- -109 <= matix[i][j] <= 109
- All the integers in each row are sorted in ascending order.
- All the integers in each column are sorted in ascending order.
- -109 <= target <= 109

## Solution

```java
class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        int m = matrix.length;
        int n = matrix[0].length;
        int row = 0;
        int col = n - 1;
        while (row < m && col >= 0) {
            int value = matrix[row][col];
            if (value == target) return true;
            if (target < value) {
                col--;
            } else {
                row++;
            }
        } 
        return false;
    }   
}
```
