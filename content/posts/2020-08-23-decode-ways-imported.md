---
author: "volyx"
title:  "Decode Ways"
date: "2020-08-23"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

A message containing letters from A-Z is being encoded to numbers using the following mapping:

```
'A' -> 1
'B' -> 2
...
'Z' -> 26
```

Given a non-empty string containing only digits, determine the total number of ways to decode it.

```
Example 1:

Input: "12"
Output: 2
Explanation: It could be decoded as "AB" (1 2) or "L" (12).
```

```
Example 2:

Input: "226"
Output: 3
Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
```

Solution:

```java
class Solution {
    public int numDecodings(String input) {
        int[] dp = new int[input.length() + 1];
        dp[0] = 1;
        dp[1] = input.charAt(0) == '0' ? 0: 1;
        for (int i = 2; i <= input.length(); i++) {
            Integer oneDigit = Integer.valueOf(input.substring(i - 1, i));
            Integer twoDigit = Integer.valueOf(input.substring(i - 2, i));
            if (oneDigit >= 1) {
                dp[i] += dp[i - 1];
            }
            if (twoDigit >= 10 && twoDigit <= 26) {
                dp[i] += dp[i - 2];
            }
        }
        System.out.println(Arrays.toString(dp));
        return dp[input.length()];
    }
}
