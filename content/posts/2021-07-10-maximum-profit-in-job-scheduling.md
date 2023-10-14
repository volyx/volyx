---
author: "volyx"
title:  "1235. Maximum Profit in Job Scheduling"
date: "2021-07-10"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "binary-search"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1235. Maximum Profit in Job Scheduling](https://leetcode.com/problems/maximum-profit-in-job-scheduling/)

We have n jobs, where every job is scheduled to be done from startTime[i] to endTime[i], obtaining a profit of profit[i].

You're given the startTime, endTime and profit arrays, return the maximum profit you can take such that there are no two jobs in the subset with overlapping time range.

If you choose a job that ends at time X you will be able to start another job that starts at time X.

```txt
Example 1:

Input: startTime = [1,2,3,3], endTime = [3,4,5,6], profit = [50,10,40,70]
Output: 120
Explanation: The subset chosen is the first and fourth job. 
Time range [1-3]+[3-6] , we get profit of 120 = 50 + 70.
```

![ex1](/images/2021-07-10-ex1.png)

```txt
Example 2:

Input: startTime = [1,2,3,4,6], endTime = [3,5,10,6,9], profit = [20,20,100,70,60]
Output: 150
Explanation: The subset chosen is the first, fourth and fifth job. 
Profit obtained 150 = 20 + 70 + 60.
```

![ex2](/images/2021-07-10-ex2.png)

```txt
Example 3:

Input: startTime = [1,1,1], endTime = [2,3,4], profit = [5,6,4]
Output: 6
```

![ex3](/images/2021-07-10-ex3.png)

Constraints:

- 1 <= startTime.length == endTime.length == profit.length <= 5 * 10^4
- 1 <= startTime[i] < endTime[i] <= 10^9
- 1 <= profit[i] <= 10^4

## Solution

```java
class Solution {
    public int findPeakElement(int[] nums) {
        int lo = 0; 
        int hi = nums.length - 1;
        
        if (nums.length == 1) {
            return 0;
        }
        
        while (lo <= hi) {
            
            int mid = lo + (hi - lo) / 2;
            
            if (isPeak(nums, mid)) {
                return mid;
            } else if (nums[mid + 1] > nums[mid]) {
                lo = mid + 1;
            } else {
                hi = mid - 1;
            }
            
        }
        return lo;
    }
    
    boolean isPeak(int[] nums, int x) {
        if (x == 0) {
            return nums[x] > nums[x + 1];
        }
        
        if (x == nums.length - 1) {
            return nums[x] > nums[x - 1];
        }
        
        return nums[x] > nums[x - 1] && nums[x] > nums[x + 1];
    }
}
```
