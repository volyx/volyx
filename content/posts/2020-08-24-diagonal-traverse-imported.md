---
author: "volyx"
title:  "Diagonal Traverse"
date: "2020-08-24"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a matrix of M x N elements (M rows, N columns), return all elements of the matrix in diagonal order as shown in the below image.

 

Example:

Input:
[
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]

Output:  [1,2,4,7,5,3,6,8,9]

Explanation:

![ex1](/images/2020-08-24-ex1.png) 

Note:

The total number of elements of the given matrix will not exceed 10,000.


Solution:

```java
class Solution {
    public int[] findDiagonalOrder(int[][] A) {
        if (A == null || A.length == 0) {
            return new int[]{};
        }
        int rows = A.length;
        int cols  = A[0].length;

        int[] list = new int[rows * cols];
        int row = 0;
        int col = 0;
        int direction = 1;
        
        for (int i = 0; i < list.length; i++) {
            list[i] = A[row][col];
            if (direction == 1) {
                if (col == cols - 1) {
                    direction = -1;
                    row++;                    
                } else if (row == 0) {
                    col++;
                    direction = -1;
                } else {
                    row--;
                    col++; 
                }
            } else {
                if (row == rows - 1) {
                    col++;
                    direction = 1;
                } else if (col == 0) {
                    row++;
                    direction = 1;
                } else {
                    row++;
                    col--;
                }
            }
        }
        return list;
    }
}
