---
author: "volyx"
title:  "1528. Shuffle String"
date: "2021-07-31"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1528. Shuffle String](https://leetcode.com/problems/shuffle-string/)

A city's skyline is the outer contour of the silhouette formed by all the buildings in that city when viewed from a distance. Given the locations and heights of all the buildings, return the skyline formed by these buildings collectively.

The geometric information of each building is given in the array buildings where buildings[i] = [lefti, righti, heighti]:

- lefti is the x coordinate of the left edge of the ith building.
- righti is the x coordinate of the right edge of the ith building.
- heighti is the height of the ith building.

You may assume all buildings are perfect rectangles grounded on an absolutely flat surface at height 0.

The skyline should be represented as a list of "key points" sorted by their x-coordinate in the form [[x1,y1],[x2,y2],...]. Each key point is the left endpoint of some horizontal segment in the skyline except the last point in the list, which always has a y-coordinate 0 and is used to mark the skyline's termination where the rightmost building ends. Any ground between the leftmost and rightmost buildings should be part of the skyline's contour.

Note: There must be no consecutive horizontal lines of equal height in the output skyline. For instance, [...,[2 3],[4 5],[7 5],[11 5],[12 7],...] is not acceptable; the three lines of height 5 should be merged into one in the final output as such: [...,[2 3],[4 5],[12 7],...]

```txt
Example 1:

Input: buildings = [[2,9,10],[3,7,15],[5,12,12],[15,20,10],[19,24,8]]
Output: [[2,10],[3,15],[7,12],[12,0],[15,10],[20,8],[24,0]]
Explanation:
Figure A shows the buildings of the input.
Figure B shows the skyline formed by those buildings. The red points in figure B represent the key points in the output list.
```

![ex1](/images/2021-07-30-ex1.jpg)

```txt
Example 2:

Input: buildings = [[0,2,3],[2,5,3]]
Output: [[0,3],[5,0]]
```

Constraints:

- 1 <= buildings.length <= 104
- 0 <= lefti < righti <= 231 - 1
- 1 <= heighti <= 231 - 1
- buildings is sorted by lefti in non-decreasing order.

## Solution

```java
class Solution {
    public List<List<Integer>> getSkyline(int[][] buildings) {
        
        List<Point> points = new ArrayList<>();
        
        for (int[] building: buildings) {
            int left = building[0];
            int right = building[1];
            int height = building[2];
            points.add(new Point(left, height, true));
            points.add(new Point(right, height, false));
        }
        
        Collections.sort(points);
        
        // TreeMap<Integer, Integer> queue = new TreeMap<Integer, Integer>();
        PriorityQueue<Integer> heap = new PriorityQueue<>(Collections.reverseOrder());
        // queue.put(0, 1);
        heap.add(0);
        
        List<List<Integer>> res = new ArrayList<>();
        int prevMax = 0;
        
        for (Point p: points) {
            if (p.isStart) {
                // queue.compute(p.h, (key, value) -> {
                //     if (value != null) {
                //         return value + 1;
                //     } 
                //     return 1;
                // });
                heap.add(p.h);
            } else {
                // queue.compute(p.h, (key, value) -> {
                //     if (value == 1) {
                //         return null;
                //     }
                //     return value - 1;
                // });
                heap.remove(p.h);
            }
            
            // int currentMax = queue.lastKey();
            int currentMax= heap.peek();
            
            if (currentMax != prevMax) {
                res.add(Arrays.asList(p.x, currentMax));
                prevMax = currentMax;
            }
        }   
        return res;
    }
    
    class Point implements Comparable<Point> {
        int x;
        int h;
        boolean isStart;
        
        Point(int x, int h, boolean isStart) {
            this.x = x;
            this.h = h;
            this.isStart = isStart;
        }
        //first compare by x.
        //If they are same then use this logic
        //if two starts are compared then higher height building should be picked first
        //if two ends are compared then lower height building should be picked first
        //if one start and end is compared then start should appear before end
        public int compareTo(Point other) {
            int compare = Integer.compare(this.x, other.x);
            if (compare != 0) return compare;
            /*
            ┌─────────────┐
            ├──────┐      │
            │      │      │
            └──────┴──────┘
            */
            
            if (this.isStart && other.isStart) {
                return - Integer.compare(this.h, other.h);
            }
            
            /*
            +------------+
            |    +-------+
            |    |       |
            +----+-------+
            */
            
            if (!this.isStart && !other.isStart) {
                return Integer.compare(this.h, other.h);
            }
            /*
                +---+
            +---+   |
            +---+---+
            */
            return -Boolean.compare(this.isStart, other.isStart);
        }
    }
}
```
