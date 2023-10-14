---
author: "volyx"
title:  "Binary Tree Inorder Traversal"
date: "2020-05-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a binary tree, return the inorder traversal of its nodes' values.

Example:

```
Input: [1,null,2,3]
   1
    \
     2
    /
   3

Output: [1,3,2]
```

Follow up: Recursive solution is trivial, could you do it iteratively?

Solution: 

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
    private List<Integer> list = new ArrayList<>();

    public List<Integer> inorderTraversal(TreeNode root) {
        if (root == null) {
            return Collections.emptyList();
        }
        Stack<TreeNode> q = new Stack<>();
        TreeNode curr = root;
        while (!q.isEmpty() || curr != null) {
            while (curr != null) {
                q.push(curr);
                curr = curr.left;
            }
            curr = q.pop();
            list.add(curr.val);
            curr = curr.right;
        }
        return list;
    }

    public List<Integer> inorderTraversal2(TreeNode root) {
        if (root == null) {
            return Collections.emptyList();
        }
        inorderTraversal(root.left);
        list.add(root.val);
        inorderTraversal(root.right);
        return list;
    }
}
