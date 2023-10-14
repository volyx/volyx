---
author: "volyx"
title:  "1441. Build an Array With Stack Operations"
date: "2021-06-05"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1441. Build an Array With Stack Operations](https://leetcode.com/problems/build-an-array-with-stack-operations)

Given an array target and an integer n. In each iteration, you will read a number from  list = {1,2,3..., n}.

Build the target array using the following operations:

- Push: Read a new element from the beginning list, and push it in the array.
- Pop: delete the last element of the array.
- If the target array is already built, stop reading more elements.

Return the operations to build the target array. You are guaranteed that the answer is unique.

```txt
Example 1:

Input: target = [1,3], n = 3
Output: ["Push","Push","Pop","Push"]
Explanation: 
Read number 1 and automatically push in the array -> [1]
Read number 2 and automatically push in the array then Pop it -> [1]
Read number 3 and automatically push in the array -> [1,3]

Example 2:

Input: target = [1,2,3], n = 3
Output: ["Push","Push","Push"]

Example 3:

Input: target = [1,2], n = 4
Output: ["Push","Push"]
Explanation: You only need to read the first 2 numbers and stop.

Example 4:

Input: target = [2,3,4], n = 4
Output: ["Push","Pop","Push","Push","Push"]
```
 
Constraints:

- 1 <= target.length <= 100
- 1 <= target[i] <= n
- 1 <= n <= 100
- target is strictly increasing.

## Solution

```java
class Solution {

    public List<String> buildArray(int[] target, int n) {
        List<String> operations = new ArrayList<>();
        int j = 0;
        for (int i = 1; i <= n && j < target.length; i++) {
            if (i == target[j]) {
                operations.add("Push");
                j++;
            } else {
                operations.add("Push");
                operations.add("Pop");
            }
            
        }
        return operations;
    }
}
```
