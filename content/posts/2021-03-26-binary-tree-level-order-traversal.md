---
author: "volyx"
title:  "102. Binary Tree Level Order Traversal"
date: "2021-03-26"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[102. Binary Tree Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal/)

Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

```txt
Example 1:

Input: root = [3,9,20,null,null,15,7]
Output: [[3],[9,20],[15,7]]
```

![ex1](/images/2021-03-26-ex1.png)

```txt
Example 2:

Input: root = [1]
Output: [[1]]
```

```txt
Example 3:

Input: root = []
Output: []
```

Constraints:

- The number of nodes in the tree is in the range [0, 2000].
- -1000 <= Node.val <= 1000


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
    public List<List<Integer>> levelOrder(TreeNode root) {
        List<List<Integer>> levels = new ArrayList<>();
        levelOrder(root, levels, 0);
        return levels;
    }
    
    void levelOrder(TreeNode node, List<List<Integer>> paths, int k) {
        if (node == null) return;
        if (paths.size() == k) {
            paths.add(new ArrayList<>());
        }
        paths.get(k).add(node.val);
        
        levelOrder(node.left, paths, k + 1);
        levelOrder(node.right, paths, k + 1);
    }
}
```
