---
author: "volyx"
title:  "1306. Jump Game III"
date: "2021-04-06"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1306. Jump Game III](https://leetcode.com/problems/jump-game-iii/)

Given an array of non-negative integers arr, you are initially positioned at start index of the array. When you are at index i, you can jump to i + arr[i] or i - arr[i], check if you can reach to any index with value 0.

Notice that you can not jump outside of the array at any time.

```txt
Example 1:

Input: arr = [4,2,3,0,3,1,2], start = 5
Output: true
Explanation: 
All possible ways to reach at index 3 with value 0 are: 
index 5 -> index 4 -> index 1 -> index 3 
index 5 -> index 6 -> index 4 -> index 1 -> index 3 
```

```txt
Example 2:

Input: arr = [4,2,3,0,3,1,2], start = 0
Output: true 
Explanation: 
One possible way to reach at index 3 with value 0 is: 
index 0 -> index 4 -> index 1 -> index 3
```

```txt
Example 3:

Input: arr = [3,0,2,1,2], start = 2
Output: false
Explanation: There is no way to reach at index 1 with value 0.
```

Constraints:

- 1 <= arr.length <= 5 * 104
- 0 <= arr[i] < arr.length
- 0 <= start < arr.length

## Solution

```java
class Solution {
    boolean[] visited = new boolean[10_0000];
    public boolean canReach(int[] arr, int start) {
        if (start < 0 || start >= arr.length) return false;
        if (visited[start]) return false;
        visited[start] = true;
        if (arr[start] == 0) return true;
        int right = start + arr[start];
        int left = start - arr[start];
        return canReach(arr, left) || canReach(arr, right);
    }
}
```
