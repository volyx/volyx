---
author: "volyx"
title:  "255. Verify Preorder Sequence in Binary Search Tree"
date: "2021-09-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "tree", "monotonic-stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[255. Verify Preorder Sequence in Binary Search Tree](https://leetcode.com/problems/verify-preorder-sequence-in-binary-search-tree/)

Given an array of unique integers preorder, return true if it is the correct preorder traversal sequence of a binary search tree.

```txt
Example 1:

Input: preorder = [5,2,1,3,6]
Output: true

Example 2:

Input: preorder = [5,2,6,1,3]
Output: false
```

![ex1](/images/2021-09-03-ex1.jpg)

Constraints:

- 1 <= preorder.length <= 10^4
- 1 <= preorder[i] <= 10^4
- All the elements of preorder are unique.

## Solution

```java
class Solution {
    public boolean verifyPreorder(int[] preorder) {
        Stack<Integer> stack = new Stack<>();
        int lowerBound = Integer.MIN_VALUE;
        for (int val: preorder) {
            
            while (stack.size() > 0 && val > stack.peek()) {
                lowerBound = stack.pop();
            }
            
            if (val < lowerBound) {
                return false;
            }
            stack.push(val);
        }
        return true;
    }
}
```
