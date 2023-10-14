---
author: "volyx"
title:  "1266. Minimum Time Visiting All Points"
date: "2021-07-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "geometry"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1266. Minimum Time Visiting All Points](https://leetcode.com/problems/minimum-time-visiting-all-points/)

On a 2D plane, there are n points with integer coordinates points[i] = [xi, yi]. Return the minimum time in seconds to visit all the points in the order given by points.

You can move according to these rules:

- In 1 second, you can either:
        move vertically by one unit,
        move horizontally by one unit, or
        move diagonally sqrt(2) units (in other words, move one unit vertically then one unit horizontally in 1 second).
- You have to visit the points in the same order as they appear in the array.
- You are allowed to pass through points that appear later in the order, but these do not count as visits.

```txt
Example 1:

Input: points = [[1,1],[3,4],[-1,0]]
Output: 7
Explanation: One optimal path is [1,1] -> [2,2] -> [3,3] -> [3,4] -> [2,3] -> [1,2] -> [0,1] -> [-1,0]   
Time from [1,1] to [3,4] = 3 seconds 
Time from [3,4] to [-1,0] = 4 seconds
Total time = 7 seconds
```

```txt
Example 2:

Input: points = [[3,2],[-2,2]]
Output: 5
```

Constraints:

- points.length == n
- 1 <= n <= 100
- points[i].length == 2
- -1000 <= points[i][0], points[i][1] <= 1000

## Solution

```java
class Solution {
    
    public int minTimeToVisitAllPoints(int[][] points) {
        int count = 0;
        int i = 0;
        while (i < points.length - 1) {
            count += chebishevDistance(points[i], points[i + 1]);
            i++;
        }     
        
        return count;
    }    
    
    int chebishevDistance(int[] a, int[] b) {
        return Math.max(Math.abs(a[0] - b[0]), Math.abs(a[1] - b[1]));
    }
    
    int[][] DIRECTIONS = new int[][] {
        new int[] {0,1}, // top
        new int[] {1,1}, // top r
        new int[] {1,0}, // r
        new int[] {1,-1}, // down r
        
        new int[] {0,-1}, // down 
        new int[] {-1,-1}, // down l
        new int[] {-1,0}, // l
        new int[] {-1,1}, // top l
    };
    public int minTimeToVisitAllPoints2(int[][] points) {
        int i = 0;
        
        int[] current = points[i];
        int count = 0; 
        while (i < points.length - 1) {
            
            int[] next = points[i + 1];
            
            if (Arrays.equals(current, next)) {
                i++;
                continue;
            }
            
            double minDist = Double.MAX_VALUE;
            int[] bestStep = null;
            for (int[] dir: DIRECTIONS) {
                int[] nextStep = new int[] {current[0] + dir[0], current[1] + dir[1]};
                
                double distance = distance(nextStep, next);
                
                if (distance < minDist) {
                    minDist = distance;
                    bestStep = nextStep;
                }
            }
            
            current = bestStep;
            
            count++;
        }
        
        return count;
    }
    
    double distance(int[] a, int[] b) {
        double x2 = (a[0] - b[0]) * (a[0] - b[0]);
        double y2 = (a[1] - b[1]) * (a[1] - b[1]);
        return Math.sqrt(x2 + y2);
    }
}
```
