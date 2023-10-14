---
author: "volyx"
title:  "Daily Temperatures"
date: "2020-07-16"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "mock"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a list of daily temperatures T, return a list such that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.

For example, given the list of temperatures T = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].

Note: The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].

Notes:

```txt
T = [73, 74, 75, 71, 69, 72, 76, 73]
S = []
O = [ 0,  0,  0,  0,  0,  0,  0,  0]

```

Solution:

```java
class Solution {
    public int[] dailyTemperatures(int[] input) {
        Stack<Integer> stack = new Stack<>();
        int[] output = new int[input.length];
        for (int i = input.length - 1; i >= 0; i--) {
            int current = input[i];
            while (!stack.empty() && (input[stack.peek()] <= current)) {
                stack.pop();
            }
            output[i] = stack.empty() ? 0: stack.peek() - i;
            stack.add(i);
        }

        return output;
    }
}
