---
author: "volyx"
title:  "1637. Widest Vertical Area Between Two Points Containing No Points"
date: "2021-02-26"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "quick-sort"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---


![https://leetcode.com/problems/widest-vertical-area-between-two-points-containing-no-points/]

Given n points on a 2D plane where points[i] = [xi, yi], Return the widest vertical area between two points such that no points are inside the area.

A vertical area is an area of fixed-width extending infinitely along the y-axis (i.e., infinite height). The widest vertical area is the one with the maximum width.

Note that points on the edge of a vertical area are not considered included in the area.

![ex1](/images/2021-02-26-ex1.png)

```txt
Example 1:
​

Input: points = [[8,7],[9,9],[7,4],[9,7]]
Output: 1
Explanation: Both the red and the blue area are optimal.

Example 2:

Input: points = [[3,1],[9,0],[1,0],[1,4],[5,3],[8,8]]
Output: 3
```

Constraints:

- n == points.length
- 2 <= n <= 105
- points[i].length == 2
- 0 <= xi, yi <= 109

```java
class Solution {
    private static final Random RANDOM = new Random();
    public int maxWidthOfVerticalArea(int[][] points) {
        // shuffle(points);
        sort(points);

        int max = 0;
        for (int i = 0; i < points.length - 1; i++) {
            max = Math.max(max, points[i + 1][0] - points[i][0]);
        }
        return max;
    }
    
    void sort(int[][] points) {

        sort(points, 0, points.length - 1);
    }
    
    int partition(int[][] a, int lo, int hi) {
        int i = lo;
        int j = hi + 1;
        
        while (true) {
            while (less(a[++i], a[lo])) {
                if (i == hi) break;
            }   
            while (less(a[lo], a[--j])) {
                if (j == lo) break;
            }
            if (i >= j) break;
            swap(a, i, j);
        }
        swap(a, lo, j);
        return j;
    }
                   
    boolean less(int[] a, int[] b) {
        return (a[0] - b[0]) < 0;
    }
    
    void swap(int[][] a, int i, int j) {
        int x = a[i][0];
        int y = a[i][1];
        
        a[i][0] = a[j][0];
        a[i][1] = a[j][1];
        
        a[j][0] = x;
        a[j][1] = y;
    }
    
    void sort(int[][] points, int lo, int hi) {
        if (lo >= hi) return;
        int j = partition(points, lo, hi);

        sort(points, lo, j - 1);
        sort(points, j + 1, hi);
    }

    void shuffle(int[][] a) {
        for (int i = 0; i < a.length; i++) {
            swap(a, i, RANDOM.nextInt(a.length));
        }
    }
}
```