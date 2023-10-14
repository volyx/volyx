---
author: "volyx"
title:  "1631. Path With Minimum Effort"
date: "2021-04-11"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "graph", "dijkstra"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1631. Path With Minimum Effort](https://leetcode.com/problems/path-with-minimum-effort/)

You are a hiker preparing for an upcoming hike. You are given heights, a 2D array of size rows x columns, where heights[row][col] represents the height of cell (row, col). You are situated in the top-left cell, (0, 0), and you hope to travel to the bottom-right cell, (rows-1, columns-1) (i.e., 0-indexed). You can move up, down, left, or right, and you wish to find a route that requires the minimum effort.

A route's effort is the maximum absolute difference in heights between two consecutive cells of the route.

Return the minimum effort required to travel from the top-left cell to the bottom-right cell.

```txt
Example 1:

Input: heights = [[1,2,2],[3,8,2],[5,3,5]]
Output: 2
Explanation: The route of [1,3,5,3,5] has a maximum absolute difference of 2 in consecutive cells.
This is better than the route of [1,2,2,2,5], where the maximum absolute difference is 3.
```

![ex1](/images/2021-04-13-ex1.png)

```txt
Example 2:

Input: heights = [[1,2,3],[3,8,4],[5,3,5]]
Output: 1
Explanation: The route of [1,2,3,4,5] has a maximum absolute difference of 1 in consecutive cells, which is better than route [1,3,5,3,5].
```

![ex2](/images/2021-04-13-ex2.png)

```txt
Example 3:

Input: heights = [[1,2,1,1,1],[1,2,1,2,1],[1,2,1,2,1],[1,2,1,2,1],[1,1,1,2,1]]
Output: 0
Explanation: This route does not require any effort.
```

![ex3](/images/2021-04-13-ex3.png)

Constraints:

- rows == heights.length
- columns == heights[i].length
- 1 <= rows, columns <= 100
- 1 <= heights[i][j] <= 106

## Solution

```java
class Solution {
    int[][] DIRS = new int[][] {{-1, 0},{1, 0},{0, -1},{0, 1}};
    public int minimumEffortPath(int[][] heights) {
        int n = heights.length;
        int m = heights[0].length;
        int[][] d = new int[n][m];
        for (int i = 0; i < n; i++) {
            Arrays.fill(d[i], Integer.MAX_VALUE);
        }
        d[0][0] = 0;
        PriorityQueue<int[]> pq = new PriorityQueue<>((a, b) -> {
            return a[2] - b[2];
        });
        pq.add(new int[] {0, 0, 0}); // i - j - cost
        while (pq.size() > 0) {
            int[] s = pq.poll();
            int row = s[0];
            int col = s[1];
            int eff = s[2];
            if (row == n - 1 && col == m - 1)  return eff;
            for (int[] dir: DIRS) {
                int r = row + dir[0];
                int c = col + dir[1];
                if (r >= 0 && r < n && c >= 0 && c < m) {
                    int newEffort = Math.max(eff, Math.abs(heights[r][c] - heights[row][col]));
                    if (newEffort < d[r][c]) {
                        d[r][c] = newEffort;
                        pq.add(new int[] {r, c, newEffort}); 
                    }
                }
            }
            
        }
        return -1;
    }
}
```
