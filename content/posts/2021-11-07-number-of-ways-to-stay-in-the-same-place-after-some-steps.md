---
author: "volyx"
title:  "1269. Number of Ways to Stay in the Same Place After Some Steps"
date: "2021-11-07"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "dp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1269. Number of Ways to Stay in the Same Place After Some Steps](https://leetcode.com/problems/number-of-ways-to-stay-in-the-same-place-after-some-steps/)

You have a pointer at index 0 in an array of size arrLen. At each step, you can move 1 position to the left, 1 position to the right in the array, or stay in the same place (The pointer should not be placed outside the array at any time).

Given two integers steps and arrLen, return the number of ways such that your pointer still at index 0 after exactly steps steps. Since the answer may be too large, return it modulo 109 + 7.

```txt
Example 1:

Input: steps = 3, arrLen = 2
Output: 4
Explanation: There are 4 differents ways to stay at index 0 after 3 steps.
Right, Left, Stay
Stay, Right, Left
Right, Stay, Left
Stay, Stay, Stay
```

```txt
Example 2:

Input: steps = 2, arrLen = 4
Output: 2
Explanation: There are 2 differents ways to stay at index 0 after 2 steps
Right, Left
Stay, Stay
```

```txt
Example 3:

Input: steps = 4, arrLen = 2
Output: 8
```

Constraints:

- 1 <= steps <= 500
- 1 <= arrLen <= 10^6

## Solution

```java
class Solution {

    public int numWays(int steps, int arrLen) {
        int maxPos = Math.min(arrLen, steps);
        long[][] dp = new long[steps + 1][maxPos + 1];
        dp[1][0]=1;
        if(arrLen > 1) dp[1][1]=1;
        
        for (int step = 2; step <= steps; step++) {
            for (int pos = 0; pos < maxPos; pos++) {
                // STAY + RIGHT + LEFT
                dp[step][pos] = (dp[step - 1][pos] + dp[step - 1][pos + 1] + (pos > 0 ? dp[step - 1][pos - 1]: 0)) % 1_000_000_007L;
            }
            
        }
        
        // for (int step = 0; step < steps; step++) {
        //     System.out.println(Arrays.toString(dp[step]));
        // }
        
        return (int) dp[steps][0];
    }
    
    
    // TLE
    int count = 0;
    public int numWays2(int steps, int arrLen) {
        backtrack(steps, 0, 0, 0, arrLen);
        return count;
    }

    
    void backtrack(int steps, int pos, int opened, int closed, int arrLen) {
        if (pos < 0 || pos == arrLen) {
            return;
        } 
        if (opened < closed) {
            return;
        }
        if (steps == 0) {
            if (pos == 0) {
                count = count + 1;
                count = count % 1_000_000_007;
            }
            return;
        }
        // right
        backtrack(steps - 1, pos + 1, opened + 1, closed, arrLen);
        // stay
        backtrack(steps - 1, pos, opened, closed, arrLen);
        // left
        backtrack(steps - 1, pos - 1, opened, closed - 1, arrLen);
    }
}
 ```
