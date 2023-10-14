---
author: "volyx"
title:  "973. K Closest Points to Origin"
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

![https://leetcode.com/problems/k-closest-points-to-origin/]

We have a list of points on the plane.  Find the K closest points to the origin (0, 0).

(Here, the distance between two points on a plane is the Euclidean distance.)

You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)

```txt
Example 1:

Input: points = [[1,3],[-2,2]], K = 1
Output: [[-2,2]]
Explanation: 
The distance between (1, 3) and the origin is sqrt(10).
The distance between (-2, 2) and the origin is sqrt(8).
Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
We only want the closest K = 1 points from the origin, so the answer is just [[-2,2]].

Example 2:

Input: points = [[3,3],[5,-1],[-2,4]], K = 2
Output: [[3,3],[-2,4]]
(The answer [[-2,4],[3,3]] would also be accepted.)
```

Note:

- 1 <= K <= points.length <= 10000
- -10000 < points[i][0] < 10000
- -10000 < points[i][1] < 10000

```java


/**

------j---------K------

---------------K--j---

**/
class Solution {
    private static final Random RANDOM = new Random();
    public int[][] kClosest(int[][] points, int K) {
        int lo = 0;
        int hi = points.length - 1; 
        
        shuffle(points);
        while (lo < hi) {
            int j = partition(points, lo, hi);
            
            if (j < K) {
                lo = j + 1;
            } else if (j > K) {
                hi = j - 1;
            } else {
                return copyOf(points,K);
            }
        }
        
        return copyOf(points, K);
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
    
    static boolean less(int[] a, int[] b) {
         int diff = b[0] * b[0] + b[1]*b[1] - a[0]* a[0] - a[1] * a[1];
         return diff > 0;
    }
    
    void swap(int[][] a, int i, int j) {
        int[] temp = a[i];
        a[i] = a[j];
        a[j] = temp;
    }
    
    static int[][] copyOf(int[][] points, int k) {
        int[][] a = new int[k][];
        
        for (int i = 0; i < k; i++) {
            a[i] = points[i];
        }
        
        return a;
    }
    
       
    void shuffle(int[][] a) {
        for (int i = 0; i < a.length; i++) {
            swap(a, i, RANDOM.nextInt(a.length));
        }
    }
    
    public int[][] kClosest2(int[][] points, int K) {
        List<Point> sortedPoints = new ArrayList<>();
        for (int i = 0 ; i < points.length; i++) {
            sortedPoints.add(new Point(points[i][0], points[i][1]));
        }
        
        Collections.sort(sortedPoints);
        
        int[][] res = new int[K][2];
        
        for (int i = 0; i < Math.min(points.length, K); i++) {
            res[i] = new int []{sortedPoints.get(i).x, sortedPoints.get(i).y};
        }
        
        return res;
    }
    
    class Point implements Comparable<Point> {
        int x;
        int y;
        
        Point(int x, int y) {
            this.x = x;
            this.y = y;
        }
        
        public int compareTo(Point that) {
            return 
                (this.x * this.x + this.y * this.y) - 
                (that.x * that.x + that.y * that.y)
                ;
        }
        
        public String toString() {
            return String.format("[%d,%d]", this.x, this.y);
        }
    }
}
```

## Solution 2021-11-20

```java
class Solution {
    
    public int[][] kClosest(int[][] points, int k) {
        int n = points.length;
        int[] dist = new int[n];
        for (int i = 0; i < n; i++) {
            dist[i] = points[i][0] * points[i][0] + points[i][1] * points[i][1];
        }
        int lo = 0;
        int hi = n - 1;
        while (lo < hi) {
            int m = partition(points, dist, lo, hi);
            if (m > k) {
                hi = m - 1;
            } else if (m < k) {
                lo = m + 1;
            } else {
                break;
            }
        }
        return Arrays.copyOf(points, k);
    }
    
    int partition(int[][] points, int[] dist, int lo, int hi) {
        int swapIndex = lo;
        while (lo < hi) {
            while (lo < hi && dist[hi] >= dist[swapIndex]) {
                hi--;
            }
            while (lo < hi && dist[lo] <= dist[swapIndex]) {
                lo++;
            }
            swap(points, dist, lo, hi);
        }
        swap(points, dist, swapIndex, lo);
        return lo;
    }
    
    void swap(int[][] points, int[] dist, int i, int j) {
        int[] t = points[i];
        points[i] = points[j];
        points[j] = t;
        
        int d = dist[i];
        dist[i] = dist[j];
        dist[j] = d;
    }
    
    public int[][] kClosest2(int[][] points, int k) {
        PriorityQueue<int[]> q = new PriorityQueue<>((a, b) -> {
            int dist1 = a[0] * a[0] + a[1] * a[1];
            int dist2 = b[0] * b[0] + b[1] * b[1];
            return - Integer.compare(dist1, dist2);
        });
        
        for (int[] point: points) {
            q.add(point);
            if (q.size() > k) {
                q.poll();
            }
        }
        
        int[][] res = new int[k][2];
        int i = 0;
        while (q.size() > 0) {
            res[i++] = q.poll();
        }
        
        return res;
    }
}
```

## Solution 2022-01-23

```java
class Solution {
    
    public int[][] kClosest(int[][] points, int k) {
        int n = points.length;
        int[] dist = new int[n];
        
        for (int i = 0; i < n; i++) {
            int[] p = points[i];
            dist[i] = p[0] * p[0] + p[1] * p[1];
        }
        
        int lo = 0;
        int hi = n - 1;
        System.out.println(Arrays.toString(dist));
        while (lo < hi) {
            int m = partition(points, dist, lo, hi);
            if (m > k) {
                hi = m - 1;
            } else if (m < k) {
                lo = m + 1;
            } else {
                break;
            }
        }
        
        return Arrays.copyOf(points, k);
    }
    int partition(int[][] points, int[] dist, int lo, int hi) {
        int swapIndex = lo;
        while (lo < hi) {
            // ORDER IS IMPORTANT, IT SHOULD BE FIRST
            while (lo < hi && dist[hi] >= dist[swapIndex]) {
                hi--;
            }
            // IT SHOULD BE SECOND
            while (lo < hi && dist[lo] <= dist[swapIndex]) {
                lo++;
            }
            swap(points, dist, lo, hi);
        }
        
        swap(points, dist, swapIndex, lo);
        return lo;
    }
    
    void swap(int[][] points, int[] dist, int i, int j) {
        int[] temp = points[i];
        points[i] = points[j];
        points[j] = temp;
        
        int d = dist[i];
        dist[i] = dist[j];
        dist[j] = d;
    }
}
```
