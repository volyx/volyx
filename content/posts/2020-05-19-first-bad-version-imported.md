---
author: "volyx"
title:  "First Bad Version"
date: "2020-05-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

```txt
Example:

Given n = 5, and version = 4 is the first bad version.

call isBadVersion(3) -> false
call isBadVersion(5) -> true
call isBadVersion(4) -> true

Then 4 is the first bad version. 
```

## Solution

```java
//* The isBadVersion API is defined in the parent class VersionControl.
      boolean isBadVersion(int version); */

public class Solution extends VersionControl {
    public int firstBadVersion(int n) {
        // 11110 
        // 2 0 5
        // 1 3 5 
        // 
        int l = 0 ;
        int r = n;
        while (l < r) {
            int mid  = l + (r - l) / 2;
            if (!isBadVersion(mid)) {
                l = mid + 1;
            } else {
                r = mid;
            }
        }
        return r;
    }
}
```

## Solution 2021-06-15

```java
/* The isBadVersion API is defined in the parent class VersionControl.
      boolean isBadVersion(int version); */

public class Solution extends VersionControl {
    public int firstBadVersion(int n) {
        int l = 0;
        int r = n;
        
        // 11111110000
        while (l <= r) {
            int mid = l + (r - l) / 2;
            
            if (!isBadVersion(mid)) {
                l = mid + 1;
            } else {
                r = mid - 1;
            }
        }
        return l;
    }
}
```

## Solution 2021-10-23

```java
/* The isBadVersion API is defined in the parent class VersionControl.
      boolean isBadVersion(int version); */



/*

n = 5

0 0 0 1 1
0 1 2 3 4 
1 2 3 4 5 
    ^
      3 4
      4 5
      ^



*/

public class Solution extends VersionControl {
    public int firstBadVersion(int n) {
        int lo = 0;
        int hi = n;
        
        while (lo < hi) { // 0 < 4; 3 < 4
            int mid = lo + (hi - lo) / 2; // 2
            
            if (isBadVersion(mid) == false) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        
        return lo;
    }
}
```

## Solution 2021-11-10

```java
/* The isBadVersion API is defined in the parent class VersionControl.
      boolean isBadVersion(int version); */

public class Solution extends VersionControl {
    public int firstBadVersion(int n) {
        int lo = 1;
        int hi = n;
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (isBadVersion(mid)) { 
                hi = mid;
            } else {
               lo = mid + 1;
            }
        }
        
        return lo;
    }
}
```
