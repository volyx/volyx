---
author: "volyx"
title:  "104. Maximum Depth of Binary Tree"
date: "2021-03-11"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "binary-tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)

Given the root of a binary tree, return its maximum depth.

A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

```txt
Example 1:

Input: root = [3,9,20,null,null,15,7]
Output: 3
```

![ex1](/images/2021-03-11-maximum-depth-of-binary-tree-ex1.jpg)

```txt
Example 2:

Input: root = [1,null,2]
Output: 2
```

```txt
Example 3:

Input: root = []
Output: 0
```

```txt
Example 4:

Input: root = [0]
Output: 1
```

Constraints:

- The number of nodes in the tree is in the range [0, 104].
- -100 <= Node.val <= 100


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
    
    public int maxDepth(TreeNode root) {
        List<TreeNode> nodes = new ArrayList<>();
        List<Integer> depths = new ArrayList<>();
        if (root == null) return 0;
        nodes.add(root);
        depths.add(1);
        int max = 0;
        while (!nodes.isEmpty()) {
            TreeNode node = nodes.remove(0);
            int depth = depths.remove(0);
            max = Math.max(max, depth);
            if (node.left != null) {
                nodes.add(node.left);
                depths.add(depth + 1);
            }
            if (node.right != null) {
                nodes.add(node.right);
                depths.add(depth + 1);
            }
        }
        return max;
    }
    
    int max = 0;
    public int maxDepth2(TreeNode root) {
        if (root == null) return 0;
        depth(root, 1);
        return max;
    }
    
    void depth(TreeNode node, int depth) {
        if (node == null) return;
        max = Math.max(max, depth);
        depth(node.left, depth + 1);
        depth(node.right, depth + 1);
    }
}
```
