---
author: "volyx"
title:  "Check If It Is a Straight Line"
date: "2020-05-28"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

You are given an array coordinates, coordinates[i] = [x, y], where [x, y] represents the coordinate of a point. Check if these points make a straight line in the XY plane.

*Example 1:*

![ex1](/images/2020-05-28-ex1.jpg)

```
Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
Output: true
```

*Example 2:*

![ex1](/images/2020-05-28-ex2.jpg)

```
Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
Output: false
```

Solution: 

```java
class Solution {
    public boolean checkStraightLine(int[][] coordinates) {
        // x2 - x1
        int xdiff = coordinates[1][0] - coordinates[0][0];
        // y2 - y1
        int ydiff = coordinates[1][1] - coordinates[0][1];
        for (int i = 2; i < coordinates.length; i++) {
            int curr_xdiff = coordinates[i][0] - coordinates[i-1][0];
            int curr_ydiff = coordinates[i][1] - coordinates[i-1][1];
            if (ydiff * curr_xdiff  != xdiff * curr_ydiff) {
                return false;
            }
        }
        return true;
    }
}
