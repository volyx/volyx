---
author: "volyx"
title:  "Merge Intervals"
date: "2020-06-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a collection of intervals, merge all overlapping intervals.

Example 1:

```txt
Input: [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
```

Example 2:  

```txt
Input: [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.
```

NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.

Solution:

```java
class Solution {
    public static int[][] merge(int[][] intervals) {
        Arrays.sort(intervals, Comparator.comparingInt(a -> a[0]));
		List<int[]> result = new ArrayList<>();
		for (int[] curr : intervals) {
			if (result.isEmpty()) {
				result.add(curr);
				continue;
			}
			int[] prev = result.get(result.size() - 1);
			if (prev[1] < curr[0]) {
				result.add(curr);
			} else {
				prev[1] = Math.max(curr[1], prev[1]);
			}
		}
		return result.toArray(new int[0][0]);
	}
}
