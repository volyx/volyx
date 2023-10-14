---
author: "volyx"
title:  "74. Search a 2D Matrix"
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

[74. Search a 2D Matrix](https://leetcode.com/problems/search-a-2d-matrix/)

Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

- Integers in each row are sorted from left to right.
- The first integer of each row is greater than the last integer of the previous row.

```txt
Example 1:

Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
Output: true
```

![ex1](/images/2021-07-06-search-matrix-ex1.jpg)

```txt
Example 2:

Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
Output: false
```

![ex2](/images/2021-07-06-search-matrix-ex2.jpg)

Constraints:

- m == matrix.length
- n == matrix[i].length
- 1 <= m, n <= 100
- -104 <= matrix[i][j], target <= 10^4

## Solution

```java
class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        int cols = matrix.length;
        int rows = matrix[0].length;
        
        int lo = 0;
        int hi = cols * rows - 1;
        
        while (lo <= hi) {
            
            int mid = lo + (hi - lo) / 2;
            
            int value = matrix[mid / rows][mid % rows];
            
            if (value == target) {
                return true;
            }
            
            if (target < value) {
                hi = mid - 1;
            } else {
                lo = mid + 1;
            }
        }
        return false;
    }
}
```
