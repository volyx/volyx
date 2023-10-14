---
author: "volyx"
title:  "1428. Leftmost Column with at Least a One"
date: "2021-07-10"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "binary-search"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1428. Leftmost Column with at Least a One](https://leetcode.com/problems/leftmost-column-with-at-least-a-one/)

This problem is an interactive problem.)

A row-sorted binary matrix means that all elements are 0 or 1 and each row of the matrix is sorted in non-decreasing order.

Given a row-sorted binary matrix binaryMatrix, return the index (0-indexed) of the leftmost column with a 1 in it. If such an index does not exist, return -1.

You can't access the Binary Matrix directly. You may only access the matrix using a BinaryMatrix interface:

- BinaryMatrix.get(row, col) returns the element of the matrix at index (row, col) (0-indexed).
- BinaryMatrix.dimensions() returns the dimensions of the matrix as a list of 2 elements [rows, cols], which means the matrix is rows x cols.

Submissions making more than 1000 calls to BinaryMatrix.get will be judged Wrong Answer. Also, any solutions that attempt to circumvent the judge will result in disqualification.

For custom testing purposes, the input will be the entire binary matrix mat. You will not have access to the binary matrix directly.

```txt
Example 1:

Input: mat = [[0,0],[1,1]]
Output: 0
```

![ex1](/images/2021-07-10-leftmost-ex1.jpg)

```txt
Example 2:

Input: mat = [[0,0],[0,1]]
Output: 1
```

![ex2](/images/2021-07-10-leftmost-ex2.jpg)

```txt
Example 3:

Input: mat = [[0,0],[0,0]]
Output: -1
```

![ex3](/images/2021-07-10-leftmost-ex3.jpg)

```txt
Example 4:

Input: mat = [[0,0,0,1],[0,0,1,1],[0,1,1,1]]
Output: 1
```

![ex4](/images/2021-07-10-leftmost-ex4.jpg)

Constraints:

- rows == mat.length
- cols == mat[i].length
- 1 <= rows, cols <= 100
- mat[i][j] is either 0 or 1.
- mat[i] is sorted in non-decreasing order.

## Solution

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
        List<Integer> dimensions = binaryMatrix.dimensions();
        
        int rows = dimensions.get(0);
        int cols = dimensions.get(1);
        
        int row = 0;
        int col = cols - 1;
        
        while (row < rows && col >= 0) {
            int val = binaryMatrix.get(row, col);
            if (val == 0) {
                row++;
            } else {
                col--;
            }
        }
        
        return (col == cols - 1) ? -1: col + 1;
        
    }    
    
    public int leftMostColumnWithOne2(BinaryMatrix binaryMatrix) {
        List<Integer> dimensions = binaryMatrix.dimensions();
        
        int rows = dimensions.get(0);
        int cols = dimensions.get(1);
        int smallestIndex = Integer.MAX_VALUE;
        for (int row = 0; row < rows; row++) {
            
            int lo = 0;
            int hi = cols - 1;
            
            while (lo < hi) {
                int mid = lo + (hi - lo) / 2;
                int val = binaryMatrix.get(row, mid);
                if (val == 0) {
                    lo = mid + 1;
                } else {
                    hi = mid;
                }
            }   
            if (binaryMatrix.get(row, lo) == 1) {
                smallestIndex = Math.min(lo, smallestIndex);
            }
        }
        return smallestIndex == Integer.MAX_VALUE? -1: smallestIndex;
    }
}
```

## Solution 2021-08-15

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
        int rows = binaryMatrix.dimensions().get(0);
        int cols = binaryMatrix.dimensions().get(1);
        
        int row = 0;
        int col = cols - 1;
        /*
        000000001
        111111111
        000000001
        */
        while (row < rows && col >= 0) {
            if (binaryMatrix.get(row, col) == 1) {
                col--;
            } else {
                row++;
            }
        }
        
        if (col == -1) return 0;
        
        /*
        0000000
        0000000
        */
        
        
        if (col == cols - 1) return -1;
        
        return col + 1;
    }
}
```

## Solution 2022-01-23

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
        List<Integer> dimensions = binaryMatrix.dimensions();
        
        int n = dimensions.get(0);
        int m = dimensions.get(1);
        
        int i = 0;
        int j = m - 1;
        int leftMax = -1;
        while (i < n && j >= 0) {
            if (binaryMatrix.get(i, j) == 1) {
                leftMax = j;
                j--;
            } else {
                i++;
            }
        }
        
        return leftMax;
    }
}
```
