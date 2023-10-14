---
author: "volyx"
title:  "378. Kth Smallest Element in a Sorted Matrix"
date: "2021-03-05"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "heap"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/]

Given an n x n matrix where each of the rows and columns are sorted in ascending order, return the kth smallest element in the matrix.

Note that it is the kth smallest element in the sorted order, not the kth distinct element.

```txt
Example 1:

Input: matrix = [[1,5,9],[10,11,13],[12,13,15]], k = 8
Output: 13
Explanation: The elements in the matrix are [1,5,9,10,11,12,13,13,15], and the 8th smallest number is 13

Example 2:

Input: matrix = [[-5]], k = 1
Output: -5
```

Constraints:

- n == matrix.length
- n == matrix[i].length
- 1 <= n <= 300
- -109 <= matrix[i][j] <= -109
- All the rows and columns of matrix are guaranteed to be sorted in non-degreasing order.
- 1 <= k <= n2

```java
class Solution {

    public int kthSmallest(int[][] matrix, int k) {
        int n = matrix.length;
        int lo = matrix[0][0];
        int hi = matrix[n - 1][n - 1];
        
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (smallestK(matrix, mid, n) < k) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
    
    int smallestK(int[][] matrix, int mid, int n) {
        int row = 0;
        int col = n - 1;
        int count = 0;
        while (row < n && col >= 0) {
            if (matrix[row][col] <= mid) {
                count += col + 1;
                row++;
            } else {
                col--;
            }
        }
        return count;
    }
    
    int[] heap;

    public int kthSmallest2(int[][] matrix, int k) {
        heap = new int[k + 1];
        int n = 0;
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[0].length; j++) {
               if (n < k) {
                     heap[++n] = matrix[i][j];
                     swim(n);
                 } else {
                     if (matrix[i][j] < heap[1]) {
                         heap[1] = matrix[i][j];
                         sink(1);
                     }
                 } 
            }
        }
        
        return heap[1];
    }

    void swim(int i) {
        int j = i / 2;
        if (j > 0 && heap[i] > heap[j]) {
            swap(i, j);
            swim(j);
        }
    }
    
    void sink(int i) {
        int left = 2 * i;
        int right = 2 * i + 1;
        
        int largest = i;
        
        if (left < heap.length && heap[left] > heap[largest]) {
            largest = left;
        }
        
        if (right < heap.length && heap[right] > heap[largest]) {
            largest = right;
        }
        
        if (largest != i) {
            swap(i, largest);
            sink(largest);
        }
    }
    
    void swap(int i, int j) {
        int t = heap[i];
        heap[i] = heap[j];
        heap[j] = t;
    }
}
