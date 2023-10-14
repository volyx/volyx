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

[107. Binary Tree Level Order Traversal II](https://leetcode.com/problems/binary-tree-level-order-traversal-ii/)

Given the root of a binary tree, return the bottom-up level order traversal of its nodes' values. (i.e., from left to right, level by level from leaf to root).

```txt
Example 1:

Input: root = [3,9,20,null,null,15,7]
Output: [[15,7],[9,20],[3]]
```

![ex1](/images/2021-03-26-traversal-ii-ex1.jpg)

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

## Jamboard

![jam](/images/107_Binary_Tree_Level_Order_Traversal_II.png)

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
    public List<List<Integer>> levelOrderBottom(TreeNode root) {
        List<List<Integer>> levels = new ArrayList<>();
        level(root, levels, 0);
        return levels;
    }
    
    void level(TreeNode node, List<List<Integer>> levels, int k) {
        if (node == null) return;
        
        if (levels.size() == k) {
            levels.add(0, new ArrayList<>());
        }
        
        level(node.left, levels, k + 1);
        level(node.right, levels, k + 1);
        
        levels.get(levels.size() - k - 1).add(node.val);
    }
}
```
