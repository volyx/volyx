---
author: "volyx"
title:  "111. Minimum Depth of Binary Tree"
date: "2021-03-12"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "binary-tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[111. Minimum Depth of Binary Tree](https://leetcode.com/problems/minimum-depth-of-binary-tree/)

Given a binary tree, find its minimum depth.

The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

Note: A leaf is a node with no children.

```txt
Example 1:

Input: root = [3,9,20,null,null,15,7]
Output: 2
```

```txt
Example 2:

Input: root = [2,null,3,null,4,null,5,null,6]
Output: 5
```

Constraints:

- The number of nodes in the tree is in the range [0, 105].
- -1000 <= Node.val <= 1000

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
    int min = Integer.MAX_VALUE;
    public int minDepth(TreeNode root) {
        if (root == null) return 0;
        findMinDepth(root, 1);
        return min;
    }
    
    void findMinDepth(TreeNode node, int depth) {
        if (node == null) return;
        if (node.left == null && node.right == null) {
            min = Math.min(depth, min);
        }
        findMinDepth(node.left, depth + 1);
        findMinDepth(node.right, depth + 1);
    }
}
```

## Solution 2021-08-23

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
    int min = Integer.MAX_VALUE;
    public int minDepth(TreeNode root) {
        findMinDepth(root, 1);
        return min == Integer.MAX_VALUE ? 0: min;
    }
    
    void findMinDepth(TreeNode node, int level) {
        if (node == null) {
            return;
        }
        
        if (node.left == null && node.right == null) {
            min = Math.min(min, level);
            return;
        }
        
        findMinDepth(node.left, level + 1);
        findMinDepth(node.right, level + 1);
    }
}
```

## Solution with Stack 2021-11-11

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
    public int minDepth(TreeNode root) {
        Stack<Pair<TreeNode, Integer>> stack = new Stack<>();
        
        if (root == null) {
            return 0;
        }
        
        stack.push(new Pair<>(root, 1));
        
        int min = Integer.MAX_VALUE;
        
        while (stack.size() > 0) {
            Pair<TreeNode, Integer> pair = stack.pop();
            
            TreeNode node = pair.getKey();
            Integer currentMin = pair.getValue();
            
            if (node.left == null && node.right == null) {
                min = Math.min(min, currentMin);
                continue;
            }
            
            if (node.left != null) {
                stack.push(new Pair<>(node.left, currentMin + 1));
            }
            
            if (node.right != null) {
                stack.push(new Pair<>(node.right, currentMin + 1));
            }
        }
        
        return min;
    }
}
```
