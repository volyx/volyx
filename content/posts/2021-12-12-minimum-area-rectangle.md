---
author: "volyx"
title:  "939. Minimum Area Rectangle"
date: "2021-12-12"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "math", "hashmap"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![939. Minimum Area Rectangle](https://leetcode.com/problems/minimum-area-rectangle/)

You are given an array of points in the X-Y plane points where points[i] = [xi, yi].

Return the minimum area of a rectangle formed from these points, with sides parallel to the X and Y axes. If there is not any such rectangle, return 0.

![ex1](/images/2021-12-12-min-rectange-ex1.jpg)

```txt
Example 1:

Input: points = [[1,1],[1,3],[3,1],[3,3],[2,2]]
Output: 4
```

![ex2](/images/2021-12-12-min-rectange-ex2.jpg)

```txt
Example 2:

Input: points = [[1,1],[1,3],[3,1],[3,3],[4,1],[4,3]]
Output: 2
```

Constraints:

- 1 <= points.length <= 500
- points[i].length == 2
- 0 <= xi, yi <= 4 * 10^4
- All the given points are unique.

## Solution

```java
class Solution {
    public int minAreaRect(int[][] points) {
        Map<Integer, Set<Integer>> xMap = new HashMap<>();
        for (int i = 0; i < points.length; i++) {
            if (!xMap.containsKey(points[i][0])) {
                xMap.put(points[i][0], new HashSet<>());
            }
            xMap.get(points[i][0]).add(points[i][1]);
        }
        int min = Integer.MAX_VALUE;
        for (int i = 0; i < points.length; i++) {
            for (int j = i + 1; j < points.length; j++) {
                int x1 = points[i][0];
                int y1 = points[i][1];
                
                int x2 = points[j][0];
                int y2 = points[j][1];
                if (x1 != x2 && y1 != y2) {
                
                    if (xMap.get(x1).contains(y2) && xMap.get(x2).contains(y1)) {
                        min = Math.min(min ,(int) Math.abs( (x2 - x1) * (y2 - y1)));
                    }
                }
            }
        }
        return min == Integer.MAX_VALUE ? 0: min;
    }
}
```
