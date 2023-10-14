---
author: "volyx"
title:  "827. Making A Large Island"
date: "2021-08-06"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "dfs", "matrix"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[827. Making A Large Island](https://leetcode.com/problems/making-a-large-island/)

You are given an n x n binary matrix grid. You are allowed to change at most one 0 to be 1.

Return the size of the largest island in grid after applying this operation.

An island is a 4-directionally connected group of 1s.

```txt
Example 1:

Input: grid = [[1,0],[0,1]]
Output: 3
Explanation: Change one 0 to 1 and connect two 1s, then we get an island with area = 3.

Example 2:

Input: grid = [[1,1],[1,0]]
Output: 4
Explanation: Change the 0 to 1 and make the island bigger, only one island with area = 4.

Example 3:

Input: grid = [[1,1],[1,1]]
Output: 4
Explanation: Can't change any 0 to 1, only one island with area = 4.
```

Constraints:

- n == grid.length
- n == grid[i].length
- 1 <= n <= 500
- grid[i][j] is either 0 or 1.

## Solution

```java
class Solution {
    
    int[][] DIRECTIONS = new int[][] {
        new int[] {0,1}, // t
        new int[] {1,0}, // r
        new int[] {0, -1}, // d
        new int[] {-1, 0}
    };

    public int largestIsland(int[][] matrix) {

        // check n,m
        int max = 0;
        Map<Integer, Integer> sizes = new HashMap<>();
       int idx = 2;
        int n = matrix.length;
        int m = matrix[0].length;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (matrix[i][j] == 1) {
                    dfs(i, j, matrix, sizes, idx);
                    max = Math.max(max, sizes.getOrDefault(idx, 0));
                    idx++;
                }
            }
        }

        // [2=4,3=1,4=2,5=1]

        //      5(1)
        //2(4) 0 4(2)
        //     0

        // [1,1,1]
        // [1,0,1]
        // [1,1,1]

        // [2,2,2]
        // [2,0,2]
        // [2,2,2]

        // sizes[2=8]

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (matrix[i][j] == 0) {
                        int newSize = 1;
                        Set<Integer> closestIslands = new HashSet<>(); 
                        for (int[] dir: DIRECTIONS) {
                            int x = i + dir[0];
                            int y = j + dir[1];
                            if (x < 0 || x >= n || y < 0 || y >= m) {
                                continue;
                            }
                            closestIslands.add(matrix[x][y]);
                        }
                        for (Integer id: closestIslands) {
                            newSize += sizes.getOrDefault(id, 0);
                        }
                        max = Math.max(max, newSize); 
                }
            }
       }
        return max;
    }

    void dfs(int i, int j, int[][] matrix, Map<Integer, Integer> sizes, int idx) {

        int n = matrix.length;
        int m = matrix[0].length;

        if (i < 0 || i >= n || j < 0 || j >= m) {
            return;
        }

        matrix[i][j] = idx;
        sizes.put(idx, sizes.getOrDefault(idx, 0) + 1);

        for (int[] dir: DIRECTIONS) {
            int x = i + dir[0];
            int y = j + dir[1];
            
            if (x < 0 || x >= n || y < 0 || y >= m) {
                continue;
            }

            if (matrix[x][y] == 1) { // BUG
                dfs(x, y, matrix, sizes, idx);
            }
        }
    }

}
```
