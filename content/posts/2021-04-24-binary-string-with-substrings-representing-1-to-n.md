---
author: "volyx"
title:  "1828. Queries on Number of Points Inside a Circle"
date: "2021-04-24"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1828. Queries on Number of Points Inside a Circle](https://leetcode.com/problems/queries-on-number-of-points-inside-a-circle/)

You are given an array points where points[i] = [xi, yi] is the coordinates of the ith point on a 2D plane. Multiple points can have the same coordinates.

You are also given an array queries where queries[j] = [xj, yj, rj] describes a circle centered at (xj, yj) with a radius of rj.

For each query queries[j], compute the number of points inside the jth circle. Points on the border of the circle are considered inside.

Return an array answer, where answer[j] is the answer to the jth query.

```txt
Example 1:

Input: points = [[1,3],[3,3],[5,3],[2,2]], queries = [[2,3,1],[4,3,1],[1,1,2]]
Output: [3,2,2]
Explanation: The points and circles are shown above.
queries[0] is the green circle, queries[1] is the red circle, and queries[2] is the blue circle.
```

![ex1](/images/2021-04-17-ex1.png)

```txt
Example 2:

Input: points = [[1,1],[2,2],[3,3],[4,4],[5,5]], queries = [[1,2,2],[2,2,2],[4,3,2],[4,3,3]]
Output: [2,3,2,4]
Explanation: The points and circles are shown above.
queries[0] is green, queries[1] is red, queries[2] is blue, and queries[3] is purple.
```

![ex2](/images/2021-04-17-ex2.png)

Constraints:

- 1 <= points.length <= 500
- points[i].length == 2
- 0 <= x​​​​​​i, y​​​​​​i <= 500
- 1 <= queries.length <= 500
- queries[j].length == 3
- 0 <= xj, yj <= 500
- 1 <= rj <= 500
- All coordinates are integers.

## Solution

```java
class Solution {
    public int[] countPoints(int[][] points, int[][] queries) {
        int[] counts = new int[queries.length];
        for (int i = 0; i < queries.length; i++) {
            for (int[] p: points) {
                if (isInside(queries[i], p)) counts[i]++;
            }
        }
        return counts;
    }
    
    boolean isInside(int[] q, int[] p) {
        int xc = q[0];
        int yc = q[1];
        int r = q[2];
        
        int x = p[0];
        int y = p[1];
        
        return ((x - xc) * (x - xc) + (y - yc) * (y - yc)) <= r * r;
    }
}
```
