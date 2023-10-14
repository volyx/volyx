---
author: "volyx"
title:  "Rotting Oranges"
date: "2020-07-01"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

In a given grid, each cell can have one of three values:

    the value 0 representing an empty cell;
    the value 1 representing a fresh orange;
    the value 2 representing a rotten orange.

Every minute, any fresh orange that is adjacent (4-directionally) to a rotten orange becomes rotten.

Return the minimum number of minutes that must elapse until no cell has a fresh orange.  If this is impossible, return -1 instead.

Example 1:
```
Input: [[2,1,1],[1,1,0],[0,1,1]]
Output: 4
```

Example 2:
```
Input: [[2,1,1],[0,1,1],[1,0,1]]
Output: -1
Explanation:  The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
```

Example 3:
```
Input: [[0,2]]
Output: 0
Explanation:  Since there are already no fresh oranges at minute 0, the answer is just 0.
```

Solution:

```java
class Solution {
    public int orangesRotting(int[][] grid) {
        Queue<Orange> currQueue = new LinkedList<>();
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[0].length; j++) {
                if (grid[i][j] == 2) {
                    currQueue.add(new Orange(i, j));
                }
            }
        }

        Queue<Orange> nextQueue = new LinkedList<>();

        int minutes = 0;

        while (!currQueue.isEmpty()) {
            while (!currQueue.isEmpty()) {
                Orange rotten = currQueue.remove();
                // top
                if (rotten.row > 0 && 
                    grid[rotten.row - 1][rotten.col] == 1) {
                    grid[rotten.row - 1][rotten.col] = 2;
                    Orange orange = new Orange(rotten.row - 1, rotten.col);
                    nextQueue.add(orange);
                }

                // bottom
                if (rotten.row < grid.length - 1 && 
                    grid[rotten.row + 1][rotten.col] == 1) {
                    grid[rotten.row + 1][rotten.col] = 2;
                    nextQueue.add(new Orange(rotten.row + 1, rotten.col));
                }

                // left
                if (rotten.col > 0 && grid[rotten.row][rotten.col - 1] == 1) {
                    grid[rotten.row][rotten.col - 1] = 2;
                    nextQueue.add(new Orange(rotten.row, rotten.col - 1));
                }

                // right
                if (rotten.col < grid[0].length - 1 && 
                    grid[rotten.row][rotten.col + 1] == 1) {
                    grid[rotten.row][rotten.col + 1] = 2;
                    nextQueue.add(new Orange(rotten.row, rotten.col + 1));
                }
            }
            
            
            if (!nextQueue.isEmpty()) {
                minutes++;
            }

            currQueue.addAll(nextQueue);
            nextQueue.clear();
        }
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[0].length; j++) {
                if (grid[i][j] == 1) return -1;
            }
        }


        return minutes;
    }

    class Orange {
        Orange(int row, int col) {
            this.row = row;
            this.col = col;
        }

        int row;
        int col;
    }
}

