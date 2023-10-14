---
author: "volyx"
title:  "199. Binary Tree Right Side View"
date: "2021-03-27"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[199. Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view/)

Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

```txt
Example 1:

Input: root = [1,2,3,null,5,null,4]
Output: [1,3,4]
```

![ex1](/images/2021-03-27-ex1.jpg)

```txt
Example 2:

Input: root = [1,null,3]
Output: [1,3]
```

```txt
Example 3:

Input: root = []
Output: []
```

Constraints:

- The number of nodes in the tree is in the range [0, 100].
- -100 <= Node.val <= 100

## Recursive

![jam1](/images/199_Binary_Tree_Right_Side_View-recurcsive.png)

## Iterative

![jam2](/images/199_Binary_Tree_Right_Side_View-iterative.png)

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
    int head = 0;
    int tail = 0;
    TreeNode[] q = new TreeNode[101];
    public List<Integer> rightSideView(TreeNode root) {
        List<Integer> res = new ArrayList<>();
        if (root == null) return Collections.emptyList();
        add(root);
        while (!isEmpty()) {
            res.add(peek().val);
            int n = size(); // remove prev level
            for (int i = 0; i < n; i++) {
                TreeNode node = poll();
                if (node.right != null) add(node.right);
                if (node.left != null) add(node.left);
            }
        }
        return res;
    }
    
    boolean isEmpty() {
        return tail == head;
    }
    
    int size() {
        return tail - head;
    }
    
    TreeNode poll() {
         if (!isEmpty()) {
            return q[head++];
        }
        throw new RuntimeException();
    }
    
    void add(TreeNode a) {
        q[tail] = a;
        tail++;
    }
    
    TreeNode peek() {
       return q[head];
    }
    
    public List<Integer> rightSideView2(TreeNode root) {
        List<Integer> res = new ArrayList<>();
        visit(root, res, 0);
        return res;
    }
    
    void visit(TreeNode node, List<Integer> res, int depth) {
        if (node == null) return;
        if (res.size() == depth) {
            res.add(depth, node.val);
        }
        visit(node.right, res, depth + 1);
        visit(node.left, res, depth + 1);
    }
}
```

## Solution 15-06-2021

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
    public List<Integer> rightSideView(TreeNode root) {
        List<Integer> levels = new ArrayList<>();
        dfs(0, root, levels);
        return levels;
    }

    void dfs(int level, TreeNode root, List<Integer> levels) {
        if (root == null) {
           return;
        }
        add(level, root.val, levels); // 2 5
        dfs(level + 1, root.left, levels);
        dfs(level + 1, root.right, levels);
    }


    // 0 1 2 3 4 -> 5
    // []
    void add(int level, int val, List<Integer> levels) {
        // first element on level
        if (levels.size() == level) {
            levels.add(val);
            return;
        }

        // remove previous, add new element
        levels.remove(level);
        levels.add(level, val);
    }

}
```
