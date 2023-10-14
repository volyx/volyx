---
author: "volyx"
title:  "1441. Build an Array With Stack Operations"
date: "2021-03-27"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1441. Build an Array With Stack Operations](https://leetcode.com/problems/build-an-array-with-stack-operations/)

Given an array target and an integer n. In each iteration, you will read a number from  list = {1,2,3..., n}.

Build the target array using the following operations:

- Push: Read a new element from the beginning list, and push it in the array.
- Pop: delete the last element of the array.
    If the target array is already built, stop reading more elements.

Return the operations to build the target array. You are guaranteed that the answer is unique.

```txt
Example 1:

Input: target = [1,3], n = 3
Output: ["Push","Push","Pop","Push"]
Explanation: 
Read number 1 and automatically push in the array -> [1]
Read number 2 and automatically push in the array then Pop it -> [1]
Read number 3 and automatically push in the array -> [1,3]
```

```txt
Example 2:

Input: target = [1,2,3], n = 3
Output: ["Push","Push","Push"]
```

```txt
Example 3:

Input: target = [1,2], n = 4
Output: ["Push","Push"]
Explanation: You only need to read the first 2 numbers and stop.
```

```txt
Example 4:

Input: target = [2,3,4], n = 4
Output: ["Push","Pop","Push","Push","Push"]
```

Constraints:

- 1 <= target.length <= 100
- 1 <= target[i] <= n
- 1 <= n <= 100
- target is strictly increasing.

## Jamboard

![jam1](/images/1441_Build_an_Array_With_Stack_Operations.png)

## Solution

```java
class Solution {
    public List<String> buildArray(int[] target, int n) {
        List<String> res = new ArrayList<>();
        int i = 0;
        int j = 1;
        while (i < target.length) {
            res.add("Push");
            if (target[i] != j) {
                res.add("Pop");
            } else {
                i++;
            }
            j++;
        }
        return res;
    }
}
```
