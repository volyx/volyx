---
author: "volyx"
title:  "Binary Tree Level Order Traversal II"
date: "2020-07-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

For example:
Given binary tree [3,9,20,null,null,15,7],

```
    3
   / \
  9  20
    /  \
   15   7
```

return its bottom-up level order traversal as:

```
[
  [15,7],
  [9,20],
  [3]
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
    public List<List<Integer>> levelOrderBottom(TreeNode root) {
        Map<Integer, List<Integer>> map = new TreeMap<>((a,b) -> {
            return b - a;
        });
        dfs(root, 0, map);
        System.out.println(map);
        List<List<Integer>> result = new ArrayList<>();
        for (List<Integer> levelNodes: map.values()) {
            result.add(levelNodes);
        }
        return result;
    }
    
    void dfs(TreeNode node, int level, Map<Integer, List<Integer>> map) {
        if (node == null) {
            return;
        }
        
        dfs(node.left, level + 1, map);
        
        addLevelNode(map, node.val, level);
        
        dfs(node.right, level + 1, map);
    }
    
    void addLevelNode(Map<Integer, List<Integer>> map, int val, int level) {
        List<Integer> levelList = map.getOrDefault(level, new ArrayList<>());
        levelList.add(val);
        map.put(level, levelList);
    }
}
