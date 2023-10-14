---
author: "volyx"
title:  "Diameter of Binary Tree"
date: "2020-04-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "mock"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

Example:
Given a binary tree

```txt
          1
         / \
        2   3
       / \
      4   5
```

Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].

Note: The length of path between two nodes is represented by the number of edges between them. 

```txt
{3,4}     1
         / \
{2,2}   2   3{0,1}
       / \
{0,1} 4   5{0,1}
```

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {

    Node dfs(TreeNode root) {
        if (root == null) {
            return new Node();
        }
        Node left = dfs(root.left);
        Node right = dfs(root.right);
        // diametr, depth
        int diam = Math.max(Math.max(left.diametr, right.diametr), left.depth + right.depth);

        return new Node(diam, 1 + Math.max(left.depth, right.depth));
    }

    public int diameterOfBinaryTree(TreeNode root) {
      return dfs(root).diametr;
    }

    class Node {
        Node() {}

        Node(int diametr, int depth) {
            this.diametr = diametr;
            this.depth = depth;
        }
        public int diametr;
        public int depth;
    }
}
```

## Solutions

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
    int maxDistance = 0;
    
    public int diameterOfBinaryTree(TreeNode root) {        
        longest(root);
        return maxDistance;
    }
    
    int longest(TreeNode node) {
        if (node == null) return 0;
        
        int leftLen = longest(node.left);
        int rightLen = longest(node.right);
        
        maxDistance = Math.max(maxDistance, leftLen + rightLen);
        
        return 1 + Math.max(leftLen, rightLen);
    }
}
```

## Solution 2021-10-29

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
    int diameter = 0;
    public int diameterOfBinaryTree(TreeNode root) {
        depth(root);
        return diameter;
    }
    
    int depth(TreeNode node) {
        if (node == null) {
            return 0;
        }
        
        int left = depth(node.left);
        int right = depth(node.right);
        
        diameter = Math.max(diameter, left + right);
        
        return Math.max(left, right) + 1;
    }
}
```

## Solution 2021-11-08

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
    int maxLen = 0;
    public int diameterOfBinaryTree(TreeNode root) {
        longestPath(root);
        return maxLen;
    }
    
    int longestPath(TreeNode node) {
        if (node == null) {
            return 0;
        }
        
        int leftLevel = longestPath(node.left);
        int rightLevel = longestPath(node.right);
        
        System.out.println("node " + node.val + " " + leftLevel + " " + rightLevel);
        
        maxLen = Math.max(maxLen, leftLevel + rightLevel);
        
        return Math.max(leftLevel, rightLevel) + 1;
    }
}
```

## Solution 2021-11-18 Iterative

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
    
    public int diameterOfBinaryTree(TreeNode root) {
        
        Queue<TreeNode> q = new ArrayDeque<>();
        q.add(root);
        Map<TreeNode, TreeNode> parents = new HashMap<>();
        TreeNode deepestNode = root;
        
        while (q.size() > 0) {
            int size = q.size();
            
            for (int i = 0; i < size; i++) {
                TreeNode node = q.poll();
                deepestNode = node;
                
                if (node.left != null) {
                    parents.put(node.left, node);
                    q.add(node.left);
                }
                
                if (node.right != null) {
                    parents.put(node.right, node);
                    q.add(node.right);
                }
            }
        }
        
        q.add(deepestNode);
        Set<TreeNode> visited = new HashSet<>();
        visited.add(deepestNode);
        int diameter = 0;
        
        while (q.size() > 0) {
            int size = q.size();
            
            for (int i = 0; i < size; i++) {
                TreeNode node = q.poll();
                
                for (TreeNode next: new TreeNode[] {node.left, node.right, parents.get(node)}) {
                    if (next != null && !visited.contains(next)) {
                        q.add(next);
                        visited.add(next);
                    }
                }
               
            }
            diameter++;
        }
        
        return diameter - 1;
    }
    
    int maxLen = 0;
    public int diameterOfBinaryTreeRec(TreeNode root) {
        longest(root);
        return maxLen;
    }
    
    int longest(TreeNode node) {
        if (node == null) {
            return 0;
        }
        
        int left = longest(node.left);
        int right = longest(node.right);
        
        maxLen = Math.max(maxLen, left + right);
        
        return Math.max(left, right) + 1;
    }
}
```

## Solution 2022-01-30

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
    int max = -1;
    public int diameterOfBinaryTree(TreeNode root) {
        depth(root);
        return max;
    }
    
    int depth(TreeNode node) {
        if (node == null) {
            return 0;
        }
        
        int maxLeft = depth(node.left);
        int maxRight = depth(node.right);
        
        max = Math.max(maxLeft + maxRight, max);
        
        return Math.max(maxLeft, maxRight) + 1;
    }
}
```
