---
author: "volyx"
title:  "1010. Pairs of Songs With Total Durations Divisible by 60"
date: "2021-01-02"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "hashmap"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1010. Pairs of Songs With Total Durations Divisible by 60](https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60)

You are given a list of songs where the ith song has a duration of time[i] seconds.

Return the number of pairs of songs for which their total duration in seconds is divisible by 60. Formally, we want the number of indices i, j such that i < j with (time[i] + time[j]) % 60 == 0.

```txt
Example 1:

Input: time = [30,20,150,100,40]
Output: 3
Explanation: Three pairs have a total duration divisible by 60:
(time[0] = 30, time[2] = 150): total duration 180
(time[1] = 20, time[3] = 100): total duration 120
(time[1] = 20, time[4] = 40): total duration 60

Example 2:

Input: time = [60,60,60]
Output: 3
Explanation: All three pairs have a total duration of 120, which is divisible by 60.
```

Constraints:

- 1 <= time.length <= 6 * 10^4
- 1 <= time[i] <= 500

## Solution

```java
class Solution {
    public int numPairsDivisibleBy60(int[] time) {
        int[] timeMap = new int[61];
        int count = 0;
        for (int t: time) {
            count += timeMap[(60 - (t % 60)) % 60];
            timeMap[t % 60]++;
        }
        return count;
    }
}
```
