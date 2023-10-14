---
author: "volyx"
title:  "Binary Tree Zigzag Level Order Traversal"
date: "2020-10-21"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "repeat"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

For example:
Given binary tree [3,9,20,null,null,15,7],

```txt
    3
   / \
  9  20
    /  \
   15   7
```

return its zigzag level order traversal as:

```txt
[
  [3],
  [20,9],
  [15,7]
]
```

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
    public List<List<Integer>> zigzagLevelOrder(TreeNode root) {
        List<List<Integer>> result = new ArrayList<>();
        dfs(root, result, 0);
        return result;
    }

    void dfs(TreeNode node, List<List<Integer>> result, int level) {

        if (node == null) {
            return;
        }

        checkSize(result, level);

        if (level % 2 == 1) {
           result.get(level).add(0, node.val);
        } else {
            result.get(level).add(node.val);
        }

        dfs(node.left, result, level + 1);
        dfs(node.right, result, level + 1);
    }

    void checkSize(List<List<Integer>> result, int level) {
        // 0 [ [] ]
        // 1 [[][]]
        // 2 [ [][] ]
        if (result.size() <= level) {
            result.add(new ArrayList<>());
        }
    }
}
```

## Solution 2021-11-18 DFS, DFS + Stack, BFS

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
    
    public List<List<Integer>> zigzagLevelOrder(TreeNode root) {
         List<List<Integer>> res = new ArrayList<>();
         
         Queue<TreeNode> q = new ArrayDeque<>();
        
         if (root != null) {
             q.add(root);
         }
        
         int level = 0;
        
         while (q.size() > 0) {
             int size = q.size();
             
             List<Integer> levelList = new ArrayList();
             
             for (int i = 0; i < size; i++) {
                 TreeNode node = q.poll();
                 
                 if (level % 2 == 0) {
                    levelList.add(node.val);
                 } else {
                    levelList.add(0, node.val);
                 }
                 
                 if (node.left != null) {
                    q.add(node.left);
                 }
                 
                 if (node.right != null) {
                    q.add(node.right);
                 } 
             }
             res.add(levelList);
             level++;
         }
        return res;
    }
    
    
    public List<List<Integer>> zigzagLevelOrderDfsStack(TreeNode root) {
        List<List<Integer>> res = new ArrayList<>();
        
        Stack<Pair<TreeNode, Integer>> stack = new Stack<>();
        
        if (root != null) {
            stack.push(new Pair<>(root, 0));
        }
        
        while (stack.size() > 0) {
            
            Pair<TreeNode, Integer> curr = stack.pop();
            
            TreeNode node = curr.getKey();
            Integer level = curr.getValue();
            
            if (res.size() == level) {
                res.add(new ArrayList<>());
            }

            if (level % 2 == 0) {
                res.get(level).add(node.val);
            } else {
                res.get(level).add(0, node.val);
            }
            
            if (node.right != null) {
                stack.push(new Pair<>(node.right, level + 1));
            } 
            
            if (node.left != null) {
                stack.push(new Pair<>(node.left, level + 1));
            }
        }
        
        return res;
    }
    
    public List<List<Integer>> zigzagLevelOrderDfsRecursive(TreeNode root) {
        List<List<Integer>> res = new ArrayList<>();
        
        dfs(root, 0, res);
        
        return res;
    }
    
    void dfs(TreeNode node, int level, List<List<Integer>> res) {
        if (node == null) return;
        
        if (res.size() == level) {
            res.add(new ArrayList<>());
        }
        
        if (level % 2 == 0) {
            res.get(level).add(node.val);
        } else {
            res.get(level).add(0, node.val);
        }
        
        dfs(node.left, level + 1, res);
        dfs(node.right, level + 1, res);
    }
}
```
