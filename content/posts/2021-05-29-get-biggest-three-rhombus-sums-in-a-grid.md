---
author: "volyx"
title:  "1878. Get Biggest Three Rhombus Sums in a Grid"
date: "2021-05-29"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1878. Get Biggest Three Rhombus Sums in a Grid](https://leetcode.com/problems/get-biggest-three-rhombus-sums-in-a-grid/)

You are given an m x n integer matrix grid​​​.

A rhombus sum is the sum of the elements that form the border of a regular rhombus shape in grid​​​. The rhombus must have the shape of a square rotated 45 degrees with each of the corners centered in a grid cell. Below is an image of four valid rhombus shapes with the corresponding colored cells that should be included in each rhombus sum:

Note that the rhombus can have an area of 0, which is depicted by the purple rhombus in the bottom right corner.

Return the biggest three distinct rhombus sums in the grid in descending order. If there are less than three distinct values, return all of them.

![ex1](/images/2021-05-29-ex1.jpg)

```txt
Example 1:

Input: grid = [[3,4,5,1,3],[3,3,4,2,3],[20,30,200,40,10],[1,5,5,4,1],[4,3,2,2,5]]
Output: [228,216,211]
Explanation: The rhombus shapes for the three biggest distinct rhombus sums are depicted above.
- Blue: 20 + 3 + 200 + 5 = 228
- Red: 200 + 2 + 10 + 4 = 216
- Green: 5 + 200 + 4 + 2 = 211
```

![ex1](/images/2021-05-29-ex2.jpg)

```txt
Example 2:

Input: grid = [[1,2,3],[4,5,6],[7,8,9]]
Output: [20,9,8]
Explanation: The rhombus shapes for the three biggest distinct rhombus sums are depicted above.
- Blue: 4 + 2 + 6 + 8 = 20
- Red: 9 (area 0 rhombus in the bottom right corner)
- Green: 8 (area 0 rhombus in the bottom middle)
```

![ex1](/images/2021-05-29-ex3.jpg)

```txt
Example 3:

Input: grid = [[7,7,7]]
Output: [7]
Explanation: All three possible rhombus sums are the same, so return [7].
```

Constraints:

- m == grid.length
- n == grid[i].length
- 1 <= m, n <= 100
- 1 <= grid[i][j] <= 105

## Solution

```java
class Solution {
    public int[] getBiggestThree(int[][] grid) {
        int n = grid.length;
        int m = grid[0].length;
        TreeSet<Integer> pq = new TreeSet<Integer>((r1,r2) -> -Integer.compare(r1,r2));
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                pq.add(grid[i][j]);
                if (pq.size() > 3) {
                    pq.pollLast();
                }
            }
        }
        int k = 1;
        while (k < n) {
            
            for (int i = k; i < n - k; i++) {
                for (int j = k; j < m - k; j++) {
                    pq.add(getSum(grid, i, j, k));
                    if (pq.size() > 3) {
                        pq.pollLast();
                    }
                }
            }
            k++;
        }
        int[] res = new int[Math.min(pq.size(), 3)];
        for (int i = 0; i < res.length; i++) {
            res[i] = pq.pollFirst();
        }
        return res;
    }
    
    int getSum(int[][] grid, int i, int j, int k) {
        int sum = 0;
        
        int row = i;
        int col = j - k;
        
        // left - down
        while (row > i - k && col < j) {
            sum += grid[row][col];
            row--;
            col++;
        }
        
        // down - right
        while (row < i && col < j + k) {
            sum += grid[row][col];
            row++;
            col++;
        }
        
        // right - top
        while (row < i + k && col > j) {
            sum += grid[row][col];
            row++;
            col--;
        }
        
        // top-left
        while (row > i && col > j - k) {
            sum += grid[row][col];
            row--;
            col--;
        }
        return sum;
    }
}
```
