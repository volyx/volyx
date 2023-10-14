---
author: "volyx"
title:  "Binary Tree Maximum Path Sum"
date: "2020-05-13"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "mock"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a non-empty binary tree, find the maximum path sum.

For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.

Example 1:

```txt
Input: [1,2,3]

       1
      / \
     2   3

Output: 6
```

Example 2:

```txt
Input: [-10,9,20,null,null,15,7]

   -10
   / \
  9  20
    /  \
   15   7

Output: 42
```

Notes: We need to compute best sum of left-rooted path and right-rooted path in dfs.
And compare the answer with complete tree of left + rigth + value inside dfs.

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
    int answer = Integer.MIN_VALUE;
    int dfs(TreeNode node) {
        if (node == null) {
            return 0;
        }
        int x = dfs(node.left);
        int y = dfs(node.right);

        answer = Math.max(answer, node.val + x + y);

        return Math.max(0, node.val + Math.max(x,y));
    }

    public int maxPathSum(TreeNode root) {
        dfs(root);
        return answer;
    }
}
