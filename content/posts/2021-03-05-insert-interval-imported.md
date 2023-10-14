---
author: "volyx"
title:  "57. Insert Interval"
date: "2021-03-05"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "sort"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/insert-interval/]

Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).

You may assume that the intervals were initially sorted according to their start times.

```txt
Example 1:

Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]

Example 2:

Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
Output: [[1,2],[3,10],[12,16]]
Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].

Example 3:

Input: intervals = [], newInterval = [5,7]
Output: [[5,7]]

Example 4:

Input: intervals = [[1,5]], newInterval = [2,3]
Output: [[1,5]]

Example 5:

Input: intervals = [[1,5]], newInterval = [2,7]
Output: [[1,7]]
```

Constraints:

- 0 <= intervals.length <= 104
- intervals[i].length == 2
- 0 <= intervals[i][0] <= intervals[i][1] <= 105
- intervals is sorted by intervals[i][0] in ascending order.
- newInterval.length == 2
- 0 <= newInterval[0] <= newInterval[1] <= 105

```java
class Solution {
    public int[][] insert(int[][] intervals, int[] newInterval) {
        List<int[]> res = new ArrayList<>();
        int index = 0;
        int n = intervals.length;
        while (index < n && !overlaps(intervals[index],  newInterval) && intervals[index][1] < newInterval[0]) {
            res.add(intervals[index]);
            index++;
        }
        int overlapIndex = index;
        while (overlapIndex < n && overlaps(intervals[overlapIndex],  newInterval)) {
            newInterval = merge(intervals[overlapIndex], newInterval);
            overlapIndex++;
        }
        
        res.add(index, newInterval);
        
        index = overlapIndex;
        
        while (index < n && !overlaps(intervals[index],  newInterval)) {
            res.add(intervals[index]);
            index++;
        }
        
        return res.toArray(new int[res.size()][]); 
    }
    
    int[] merge(int[] a, int[] b) {
        return new int[] {Math.min(a[0], b[0]), Math.max(a[1], b[1])};
    }
    boolean overlaps(int[] a, int[] b) {
        return Math.max(a[0], b[0]) <= Math.min(a[1],b[1]);
    }
}
