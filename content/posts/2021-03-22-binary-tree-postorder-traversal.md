---
author: "volyx"
title:  "145. Binary Tree Postorder Traversal"
date: "2021-03-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[145. Binary Tree Postorder Traversal](https://leetcode.com/problems/binary-tree-postorder-traversal)

Given the root of a binary tree, return the postorder traversal of its nodes' values.

```txt
Example 1:

Input: root = [1,null,2,3]
Output: [3,2,1]
```

![ex1](/images/2021-03-22-postorder-ex1.jpg)

```txt
Example 2:

Input: root = []
Output: []
```

```txt
Example 3:

Input: root = [1]
Output: [1]
```

```txt
Example 4:

Input: root = [1,2]
Output: [2,1]
```

![ex4](/images/2021-03-22-postorder-ex4.jpg)

```txt
Example 5:

Input: root = [1,null,2]
Output: [2,1]
```

![ex5](/images/2021-03-22-postorder-ex5.jpg)

Constraints:

- The number of the nodes in the tree is in the range [0, 100].
- -100 <= Node.val <= 100

Follow up:

- Recursive solution is trivial, could you do it iteratively?

## Jamboard

![jam1](/images/145_Binary_Tree_Postorder_Traversal_1.png)

![jam2](/images/145_Binary_Tree_Postorder_Traversal_2.png)

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
    
    public List<Integer> postorderTraversal(TreeNode root) {
        List<Integer> res = new ArrayList<>();
        List<TreeNode> s = new ArrayList<>();
        TreeNode curr = root;
        TreeNode lastVisited = null;
        while (curr != null || !s.isEmpty()) {
            if (curr != null) {
                s.add(curr);
                curr = curr.left;
            } else {
                TreeNode peek = s.get(s.size() - 1);
                if (peek.right != null && peek.right != lastVisited) {
                    curr = peek.right;
                } else {
                    res.add(peek.val);
                    lastVisited = s.remove(s.size() - 1);
                }
            }
        }
        return res;
    }
    
    public List<Integer> postorderTraversal3(TreeNode root) {
        List<Integer> res = new ArrayList<>();
        List<TreeNode> s = new ArrayList<>();
        if (root != null) {
            s.add(root);
        }
        while (!s.isEmpty()) {
            TreeNode node = s.remove(s.size() - 1);
            res.add(0, node.val);
            if (node.left != null) {
                s.add(node.left);
            }
            if (node.right != null) {
                s.add(node.right);
            }
        }
        return res;
    }
    
    public List<Integer> postorderTraversal2(TreeNode root) {
        List<Integer> res = new ArrayList<>();
        visit(root, res);
        return res;
    }
    
    void visit(TreeNode node, List<Integer> res) {
        if (node == null) return;
        visit(node.left, res);
        visit(node.right, res);
        res.add(node.val);
    }
}
```
