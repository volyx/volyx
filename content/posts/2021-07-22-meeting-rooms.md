---
author: "volyx"
title:  "252. Meeting Rooms"
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

[252. Meeting Rooms](https://leetcode.com/problems/meeting-rooms/)

Given an array of meeting time intervals where intervals[i] = [starti, endi], determine if a person could attend all meetings.

```txt
Example 1:

Input: intervals = [[0,30],[5,10],[15,20]]
Output: false

Example 2:

Input: intervals = [[7,10],[2,4]]
Output: true
```

Constraints:

- 0 <= intervals.length <= 10^4
- intervals[i].length == 2
- 0 <= starti < endi <= 10^6

## Solution

```java
class Solution {
    public boolean canAttendMeetings(int[][] intervals) {
        
        if (intervals.length < 2) {
            return true;
        }
        
        Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
        
        
        for (int i = 1; i < intervals.length; i++) {
            int[] curr = intervals[i];
            int[] prev = intervals[i - 1];
            
            if (overlap(prev, curr)) {
                return false;
            }
        }
        
        return true;
    }
    
    /*
    
    ---------------|
             |--------------------------
             
             
    -----------|
                    |--------------
    
    */
    boolean overlap(int[] a, int[] b) {
        return Math.max(a[0], b[0]) < Math.min(a[1], b[1]);
    }
}
```
