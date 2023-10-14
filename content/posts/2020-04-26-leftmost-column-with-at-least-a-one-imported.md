---
author: "volyx"
title:  "Leftmost Column with at Least a One"
date: "2020-04-26"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

(This problem is an interactive problem.)

A binary matrix means that all elements are 0 or 1. For each individual row of the matrix, this row is sorted in non-decreasing order.

Given a row-sorted binary matrix binaryMatrix, return leftmost column index(0-indexed) with at least a 1 in it. If such index doesn't exist, return -1.

You can't access the Binary Matrix directly.  You may only access the matrix using a BinaryMatrix interface:

    BinaryMatrix.get(row, col) returns the element of the matrix at index (row, col) (0-indexed).
    BinaryMatrix.dimensions() returns a list of 2 elements [rows, cols], which means the matrix is rows * cols.

Submissions making more than 1000 calls to BinaryMatrix.get will be judged Wrong Answer.  Also, any solutions that attempt to circumvent the judge will result in disqualification.

For custom testing purposes you're given the binary matrix mat as input in the following four examples. You will not have access the binary matrix directly.

Example 1:

![alt example1](https://assets.leetcode.com/uploads/2019/10/25/untitled-diagram-5.jpg)
```
Input: mat = [[0,0],[1,1]]
Output: 0
```

Example 2:

![alt example2](https://assets.leetcode.com/uploads/2019/10/25/untitled-diagram-4.jpg)
```
Input: mat = [[0,0],[0,1]]
Output: 1
```

Example 3:

![alt example3](https://assets.leetcode.com/uploads/2019/10/25/untitled-diagram-3.jpg)
```
Input: mat = [[0,0],[0,0]]
Output: -1
```

Example 4:

![alt example4](https://assets.leetcode.com/uploads/2019/10/25/untitled-diagram-6.jpg)
```
Input: mat = [[0,0,0,1],[0,0,1,1],[0,1,1,1]]
Output: 1
```

Constraints:
```
    rows == mat.length
    cols == mat[i].length
    1 <= rows, cols <= 100
    mat[i][j] is either 0 or 1.
    mat[i] is sorted in a non-decreasing way.
```

Dev notes: we start from top corner and find mimimal column index that don't equal 1

```java
/**
 * // This is the BinaryMatrix's API interface.
 * // You should not implement it, or speculate about its implementation
 * interface BinaryMatrix {
 *     public int get(int row, int col) {}
 *     public List<Integer> dimensions {}
 * };
 */

class Solution {
    public int leftMostColumnWithOne(BinaryMatrix binaryMatrix) {
        // [rows, cols]
        List<Integer> rowCols = binaryMatrix.dimensions();
        int rows = rowCols.get(0);
        int cols = rowCols.get(1);

        if (rows == 0 && cols == 0) {
            return -1;
        }

        int maxIndex = Integer.MAX_VALUE;
        int j = cols - 1;
        for (int i = 0; i < rows; i++) {
            while (j > -1 && binaryMatrix.get(i, j) == 1) {
                maxIndex = Math.min(maxIndex, j);
                j--;
                System.out.printf("%d %d\n", i, j);
            }
        }
        return maxIndex == Integer.MAX_VALUE ? -1: maxIndex;
    }
}
