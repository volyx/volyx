---
author: "volyx"
title: "426. Convert Binary Search Tree to Sorted Doubly Linked List"
date: "2022-01-27"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "linked-list"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1937. Maximum Number of Points with Cost](https://leetcode.com/problems/convert-binary-search-tree-to-sorted-doubly-linked-list/)

Convert a Binary Search Tree to a sorted Circular Doubly-Linked List in place.

You can think of the left and right pointers as synonymous to the predecessor and successor pointers in a doubly-linked list. For a circular doubly linked list, the predecessor of the first element is the last element, and the successor of the last element is the first element.

We want to do the transformation in place. After the transformation, the left pointer of the tree node should point to its predecessor, and the right pointer should point to its successor. You should return the pointer to the smallest element of the linked list.

 

Example 1:

Input: root = [4,2,5,1,3]


Output: [1,2,3,4,5]

Explanation: The figure below shows the transformed BST. The solid line indicates the successor relationship, while the dashed line means the predecessor relationship.

Example 2:

Input: root = [2,1,3]
Output: [1,2,3]

 

Constraints:

    The number of nodes in the tree is in the range [0, 2000].
    -1000 <= Node.val <= 1000
    All the values of the tree are unique.



## Solution

```java
class Solution {
    public long maxPoints(int[][] points) {
        int n = points.length;
        int m = points[0].length;
        int[] dp = new int[n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                dp[j] += points[i][j];
            }
            
            for (int j = 1; j < m; j++) { 
                dp[j] = Math.max(dp[j], dp[j - 1] - 1);
            }
            
            for (int j = m - 2; j >= 0; j--) {
                dp[j] = Math.max(dp[j], dp[j + 1] - 1);
            }
        }
        
        int max = 0;
        for (int i = 0; i < n; i++) {
            max = Math.max(dp[i], max);
        }
        return max;
    }
}
```
