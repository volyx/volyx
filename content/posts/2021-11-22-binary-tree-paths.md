---
author: "volyx"
title:  "257. Binary Tree Paths"
date: "2021-11-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "eays", "binary-tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![257. Binary Tree Paths](hhttps://leetcode.com/problems/binary-tree-paths/)

Given the root of a binary tree, return all root-to-leaf paths in any order.

A leaf is a node with no children.

![ex1](/images/2021-11-22-binary-tree-paths.jpg)

```txt
Example 1:

Input: root = [1,2,3,null,5]
Output: ["1->2->5","1->3"]

Example 2:

Input: root = [1]
Output: ["1"]
```

Constraints:

- The number of nodes in the tree is in the range [1, 100].
- -100 <= Node.val <= 100

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
    public List<String> binaryTreePaths(TreeNode root) {
        List<String> res = new ArrayList<>();
        dfs(root, res, "");
        return res;
    }
    
    void dfs(TreeNode node, List<String> res, String s) {
        if (node == null) {
            return;
        }
        
        if (s.length() == 0) {
            s += "" + node.val;
        } else {
            s += "->" + node.val;
        }
        
        
        if (node.left == null && node.right == null) {
            res.add(s);
            return;
        }
        
        dfs(node.left, res, s);
        
        dfs(node.right, res, s);
    }
}
```
