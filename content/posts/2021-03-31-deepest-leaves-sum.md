---
author: "volyx"
title:  "1302. Deepest Leaves Sum"
date: "2021-03-31"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "graph", "bfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1302. Deepest Leaves Sum](https://leetcode.com/problems/deepest-leaves-sum/)

Given the root of a binary tree, return the sum of values of its deepest leaves.

```txt
Example 1:

Input: root = [1,2,3,4,5,null,6,7,null,null,null,null,8]
Output: 15
```

![ex1](/images/2021-03-31-ex1.png)

```txt
Example 2:

Input: root = [6,7,8,2,7,1,3,9,null,1,4,null,null,null,5]
Output: 19
```

Constraints:

- The number of nodes in the tree is in the range [1, 104].
- 1 <= Node.val <= 100


## Solution

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    TreeNode[] q = new TreeNode[10_000];
    int head;
    int tail;
    public int deepestLeavesSum(TreeNode root) {
        if (root == null) return 0;
        q[tail++] = root;
        int sum = 0;
        while (head != tail) {
            TreeNode node = q[head];
            sum = 0;
            int size = tail - head;
            for (int i = 0; i < size; i++) {
                node = q[head++];
                sum += node.val;
                if (node.left != null) q[tail++] = node.left;
                if (node.right != null) q[tail++] = node.right;
            }
        }
        
        return sum;
    }
}
```
