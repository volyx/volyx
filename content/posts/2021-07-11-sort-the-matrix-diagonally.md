---
author: "volyx"
title:  "1329. Sort the Matrix Diagonally"
date: "2021-07-11"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array", "sort", "matrix"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1329. Sort the Matrix Diagonally](https://leetcode.com/problems/sort-the-matrix-diagonally/)

A matrix diagonal is a diagonal line of cells starting from some cell in either the topmost row or leftmost column and going in the bottom-right direction until reaching the matrix's end. For example, the matrix diagonal starting from mat[2][0], where mat is a 6 x 3 matrix, includes cells mat[2][0], mat[3][1], and mat[4][2].

Given an m x n matrix mat of integers, sort each matrix diagonal in ascending order and return the resulting matrix.

```txt
Example 1:

Input: mat = [[3,3,1,1],[2,2,1,2],[1,1,1,2]]
Output: [[1,1,1,1],[1,2,2,2],[1,2,3,3]]
```

![ex1](/images/2021-07-11-ex1.png)

```txt
Example 2:

Input: mat = [[11,25,66,1,69,7],[23,55,17,45,15,52],[75,31,36,44,58,8],[22,27,33,25,68,4],[84,28,14,11,5,50]]
Output: [[5,17,4,1,52,7],[11,11,25,45,8,69],[14,23,25,44,58,15],[22,27,31,36,50,66],[84,28,75,33,55,68]]
```

Constraints:

- m == mat.length
- n == mat[i].length
- 1 <= m, n <= 100
- 1 <= mat[i][j] <= 100

## Solution

```java
class Solution {
    /**
    
    [[1,1,1,1],
     [1,2,2,2],
     [1,2,3,3]]
    
    
    [[11,25,45,1,69,7],
     [23,36,17,58,8,52],
     [75,31,55,44,66,15],
     
     
     [22,27,33,25,68,4],
     [84,28,14,11,5,50]]
     
     [22,27,31,36,50,66],
     [84,28,75,33,55,68]]

    
    */
    public int[][] diagonalSort(int[][] mat) {
        int rows = mat.length;
        int cols = mat[0].length;
        
        
        for (int i = 0; i < rows; i++) {
            sort(i, 0, mat);
        }
        
        for (int j = 0; j < cols; j++) {
            sort(0, j, mat);
        }
        
        return mat;
    }
    
    void sort(int row, int col, int[][] mat) {
        int rows = mat.length;
        int cols = mat[0].length;
        
        int[] freq = new int[101];
        int i = row;
        int j = col;
        while (i < rows && j < cols) {
            int val = mat[i][j];
            freq[val]++;
            i++;
            j++;
        }
        
        i = row;
        j = col;
        int k = 0;
        int index = 0;
        while (i < rows && j < cols) {
            while (freq[index] == 0) {
                index++;
            }
            mat[i][j] = index;
            freq[index]--;
            
            i++;
            j++;
            k++;
        }
    }
    
    void sort2(int row, int col, int[][] mat) {
        int rows = mat.length;
        int cols = mat[0].length;
        
        List<Integer> diagonal = new ArrayList<>();
        int i = row;
        int j = col;
        while (i < rows && j < cols) {
            
            diagonal.add(mat[i][j]);
            
            i++;
            j++;
        }
        
        Collections.sort(diagonal);
        i = row;
        j = col;
        int k = 0;
        while (k < diagonal.size()) {
            mat[i][j] = diagonal.get(k);
            i++;
            j++;
            k++;
        }
    }
}
```
