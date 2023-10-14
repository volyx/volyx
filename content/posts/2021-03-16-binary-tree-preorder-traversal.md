---
author: "volyx"
title:  "144. Binary Tree Preorder Traversal"
date: "2021-03-16"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "binary-tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[144. Binary Tree Preorder Traversal](https://leetcode.com/problems/binary-tree-preorder-traversal/)

Given the root of a binary tree, return the preorder traversal of its nodes' values.

```txt
Example 1:

Input: root = [1,null,2,3]
Output: [1,2,3]
```

![ex1](/images/2021-03-16-preorder-ex1.jpg)

```txt
Example 2:

Input: root = []
Output: []
```

![ex2](/images/2021-03-16-preorder-ex2.jpg)

```txt
Example 3:

Input: root = [1]
Output: [1]
```

![ex3](/images/2021-03-16-preorder-ex3.jpg)

```txt
Example 4:

Input: root = [1,2]
Output: [1,2]
```

![ex4](/images/2021-03-16-preorder-ex4.jpg)

```txt
Example 5:

Input: root = [1,null,2]
Output: [1,2]
```

![ex5](/images/2021-03-16-preorder-ex5.jpg)

Constraints:

- The number of nodes in the tree is in the range [0, 100].
- -100 <= Node.val <= 100

Follow up: Recursive solution is trivial, could you do it iteratively?

## Jamboard

![Jamboard](/images/144_Binary_Tree_Preorder_Traversal_1.png)

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
    
    public List<Integer> preorderTraversal(TreeNode node) {
        List<Integer> res = new ArrayList<>();
        if (node == null) return res;
        TreeNode[] q = new TreeNode[1000];
        int n = 0;
        q[n++] = node;
        while (n > 0) {
            TreeNode t = q[--n];
            res.add(t.val);
            if (t.right != null) q[n++] = t.right;
            // add left as last element to retrive it first from the q
            if (t.left != null) q[n++] = t.left;
        }
        return res;
    }    
    
    public List<Integer> preorderTraversal2(TreeNode node) {
        List<Integer> res = new ArrayList<>();
        visit(node, res);
        return res;
    }
    
    void visit(TreeNode node, List<Integer> res) {
        if (node == null) return;
        res.add(node.val);
        visit(node.left, res);
        visit(node.right, res);
    }
}
```
