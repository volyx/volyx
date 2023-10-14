---
author: "volyx"
title:  "897. Increasing Order Search Tree"
date: "2021-04-06"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[897. Increasing Order Search Tree](https://leetcode.com/problems/increasing-order-search-tree/)

Given the root of a binary search tree, rearrange the tree in in-order so that the leftmost node in the tree is now the root of the tree, and every node has no left child and only one right child.

```txt
Example 1:

Input: root = [5,3,6,2,4,null,8,1,null,null,null,7,9]
Output: [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]
```

![ex1](/images/2021-04-06-ex1.jpg)

```txt
Example 2:

Input: root = [5,1,7]
Output: [1,null,5,null,7]
```

![ex2](/images/2021-04-06-ex2.jpg)

Constraints:

- The number of nodes in the given tree will be in the range [1, 100].
- 0 <= Node.val <= 1000

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
    TreeNode res = null;
    TreeNode next = null;
    public TreeNode increasingBST(TreeNode root) {
        if (root == null) return null;
        dfs(root);
        return res;
    }
    
    void dfs(TreeNode node) {
        if (node == null) return;
        dfs(node.left);
        if (res == null) {
            res = new TreeNode(node.val);
            next = res;
        } else {
            next.right = new TreeNode(node.val);
            next = next.right;
        }
        
        dfs(node.right);
    }
}
```
