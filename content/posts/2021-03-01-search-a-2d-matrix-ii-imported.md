---
author: "volyx"
title:  "240. Search a 2D Matrix II"
date: "2021-03-01"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "devide-and-conquer"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/search-a-2d-matrix-ii/]

Write an efficient algorithm that searches for a target value in an m x n integer matrix. The matrix has the following properties:

- Integers in each row are sorted in ascending from left to right.
- Integers in each column are sorted in ascending from top to bottom.

![ex1](/images/2021-03-01-ex1.png)

```txt
Example 1:

Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
Output: true
```

![ex2](/images/2021-03-01-ex2.png)

```txt
Example 2:

Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
Output: false
```

Constraints:

- m == matrix.length
- n == matrix[i].length
- 1 <= n, m <= 300
- -109 <= matix[i][j] <= 109
- All the integers in each row are sorted in ascending order.
- All the integers in each column are sorted in ascending order.
- -109 <= target <= 109

```java
class Solution {
    
    public boolean searchMatrix(int[][] matrix, int target) {
        int n = matrix.length;
        int m = matrix[0].length;
        
        int i = 0;
        int j = m - 1;
        
        while (i < n && j >= 0 ) {
            if (target < matrix[i][j]) {
                j--;
            } else if (target > matrix[i][j]) {
                i++;
            } else {
                return true;
            }
        }
        
        return false;
    }
}
