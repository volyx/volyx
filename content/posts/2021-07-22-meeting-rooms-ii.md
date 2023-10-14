---
author: "volyx"
title:  "253. Meeting Rooms II"
date: "2021-07-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "sort"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[253. Meeting Rooms II](https://leetcode.com/problems/meeting-rooms-ii/)

Given an array of meeting time intervals intervals where intervals[i] = [starti, endi], return the minimum number of conference rooms required.

```txt
Example 1:

Input: intervals = [[0,30],[5,10],[15,20]]
Output: 2

Example 2:

Input: intervals = [[7,10],[2,4]]
Output: 1
```

Constraints:

- 1 <= intervals.length <= 10^4
- 0 <= starti < endi <= 10^6

## Solution

```java
class Solution {
    /*
    [[0,30],[5,10],[15,20]]

     [ 0,30] 
     [ 5,10] ----
     [15,20]


     (1, 10), (2, 7), (3, 19), (8, 12), (10, 20), (11, 30)
    
    
    */
    public int minMeetingRooms(int[][] intervals) {
        Arrays.sort(intervals, (a,b) -> a[0] - b[0]);
        PriorityQueue<int[]> pq = new PriorityQueue<int[]>((a,b) -> {
            return a[1] - b[1];
        });
        for (int[] interval: intervals) {
            if (!pq.isEmpty() && pq.peek()[1] <= interval[0]) {
                pq.poll();
            }
            pq.add(interval);
        }
        
        return pq.size();
    }
}
```


## Solution 2

```java
class Solution {
    public int minMeetingRooms(int[][] intervals) {
        
        Integer min = Integer.MAX_VALUE;
        Integer max = Integer.MIN_VALUE;
        
        
        for (int[] i: intervals) {
            min = Math.min(min, i[0]);
            max = Math.max(max, i[1]);
        }
        
        int[] times = new int[max - min + 1];
        
        
        for (int[] i: intervals) {
            times[i[0] - min]++;
            times[i[1] - min]--;
        }
        
        
        int count = 0;
        int result = 0;
        for (int time: times) {
            count += time;
            result = Math.max(result, count);
        }
        
        return result;
    }
}
```
