---
author: "volyx"
title:  "1329. Sort the Matrix Diagonally"
date: "2021-03-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "sort"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/sort-the-matrix-diagonally/]

A matrix diagonal is a diagonal line of cells starting from some cell in either the topmost row or leftmost column and going in the bottom-right direction until reaching the matrix's end. For example, the matrix diagonal starting from mat[2][0], where mat is a 6 x 3 matrix, includes cells mat[2][0], mat[3][1], and mat[4][2].

Given an m x n matrix mat of integers, sort each matrix diagonal in ascending order and return the resulting matrix.

```txt
Example 1:

Input: mat = [[3,3,1,1],[2,2,1,2],[1,1,1,2]]
Output: [[1,1,1,1],[1,2,2,2],[1,2,3,3]]

Example 2:

Input: mat = [[11,25,66,1,69,7],[23,55,17,45,15,52],[75,31,36,44,58,8],[22,27,33,25,68,4],[84,28,14,11,5,50]]
Output: [[5,17,4,1,52,7],[11,11,25,45,8,69],[14,23,25,44,58,15],[22,27,31,36,50,66],[84,28,75,33,55,68]]
```

Constraints:

- m == mat.length
- n == mat[i].length
- 1 <= m, n <= 100
- 1 <= mat[i][j] <= 100

```java
class Solution {
    public int[][] diagonalSort(int[][] mat) {
        int n = mat.length;
        int m = mat[0].length;
        int[] freq = new int[101];
        for (int i = 0; i < n; i++) {
            sort(mat, i, 0, freq);
        }
        for (int i = 0; i < m; i++) {
            sort(mat, 0, i, freq);
        }
        return mat;
    }
    
    void sort(int[][] mat, int row, int col, int[] freq) {
        Arrays.fill(freq, 0);
        int n = mat.length;
        int m = mat[0].length;
        int i = row;
        int j = col;
        while (i < n && j < m) {
            freq[mat[i][j]]++;
            i++;
            j++;
        }
        i = row;
        j = col;
        while (i < n && j < m) {
            mat[i][j] = getNext(freq);
            i++;
            j++;
        }
    }
    
    int getNext(int[] freq) {
        for (int i = 0; i < freq.length; i++) {
            if (freq[i] != 0) {
                freq[i]--;
                return i;
            }
        }
        throw new RuntimeException();
    }
}
