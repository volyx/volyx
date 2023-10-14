---
author: "volyx"
title:  "261. Graph Valid Tree"
date: "2021-10-12"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "tree","bfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![958. Check Completeness of a Binary Tree](https://leetcode.com/problems/check-completeness-of-a-binary-tree/)

Given the root of a binary tree, determine if it is a complete binary tree.

In a complete binary tree, every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

```txt
Example 1:

Input: root = [1,2,3,4,5,6]
Output: true
Explanation: Every level before the last is full (ie. levels with node-values {1} and {2, 3}), and all nodes in the last level ({4, 5, 6}) are as far left as possible.
```

![ex1](/images/2021-10-12-complete-tree-ex1.png)

```txt
Example 2:

Input: root = [1,2,3,4,5,null,7]
Output: false
Explanation: The node with value 7 isn't as far left as possible.
```

![ex2](/images/2021-10-12-complete-tree-ex2.png)

Constraints:

- The number of nodes in the tree is in the range [1, 100].
- 1 <= Node.val <= 1000

## Solution BFS

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
    int depth = 0;
    public boolean isCompleteTree(TreeNode root) {
        depth(root, 0);
        Queue<TreeNode> q = new LinkedList<>();
        q.add(root);
        int level = 0;
        // System.out.println("depth = " + depth);
        while (q.size() > 0) {
            int size = q.size();
            boolean seenNull = false;
            for (int i = 0; i < size; i++) {
                
                TreeNode node = q.poll();
                
                if (level != depth && node == null) {
                    return false;
                }
                
                if (level == depth) {
                    if (node == null) {
                        seenNull = true;
                    } else {
                        if (seenNull) return false;
                    }
                }
                
                if (node == null) continue;
                
                q.add(node.left);
                
                q.add(node.right);
            }
            
            if (level == depth) {
                return true;
            }
            
            level++;
        }
      
        
        
        return true;
    }
    
    void depth(TreeNode node, int level) {
        if (node == null) return;
        depth = Math.max(depth, level);
        depth(node.left, level + 1);
        depth(node.right, level + 1);
    }
}
```

## Solution 2

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
    public boolean isCompleteTree(TreeNode root) {
        Queue<TreeNode> q = new LinkedList<>();
        q.add(root);
        
        while (q.peek() != null) {
            TreeNode node = q.poll();
            q.add(node.left);
            q.add(node.right);
        }
        while (q.size() > 0 && q.peek() == null) {
            q.poll();
        }
        
        return q.size() == 0;
    }
}
```
