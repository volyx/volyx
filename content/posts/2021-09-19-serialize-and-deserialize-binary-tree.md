---
author: "volyx"
title:  "297. Serialize and Deserialize Binary Tree"
date: "2021-09-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "tree","dfs","bfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![297. Serialize and Deserialize Binary Tree](https://leetcode.com/problems/serialize-and-deserialize-binary-tree)

Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

Clarification: The input/output format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

```txt
Example 1:

Input: root = [1,2,3,null,null,4,5]
Output: [1,2,3,null,null,4,5]
```

![ex1](/images/2021-09-19-tree-ex1.jpg)

```txt
Example 2:

Input: root = []
Output: []

Example 3:

Input: root = [1]
Output: [1]

Example 4:

Input: root = [1,2]
Output: [1,2]
```

Constraints:

- The number of nodes in the tree is in the range [0, 10^4].
- -1000 <= Node.val <= 1000

## DFS Solution

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
public class Codec {
    // Encodes a tree to a single string.
    public String serialize(TreeNode root) {
        StringBuilder sb = new StringBuilder();
        dfs(root, sb);
        System.out.println(sb.toString());
        return sb.toString();
    }
    
    void dfs(TreeNode node, StringBuilder sb) {
       if (node == null) {
           sb.append("#");
           sb.append(",");
       } else {
           sb.append(node.val);
           sb.append(",");
           dfs(node.left, sb);
           dfs(node.right, sb);
       }
    }

    // Decodes your encoded data to tree.
    public TreeNode deserialize(String data) {
        String[] values = data.split(",");
        
        System.out.println(Arrays.toString(values));

        Queue<String> q = new LinkedList<>();
        
        q.addAll(Arrays.asList(values));
        
        return buildTree(q);
    }
    
    TreeNode buildTree(Queue<String> q) {
        if (q.size() == 0) return null;
        
        String val = q.poll();
        if (val.equals("#")) return null;
        TreeNode node = new TreeNode(Integer.valueOf(val));
        node.left = buildTree(q);
        node.right = buildTree(q);
        return node;    
    }
}

// Your Codec object will be instantiated and called as such:
// Codec ser = new Codec();
// Codec deser = new Codec();
// TreeNode ans = deser.deserialize(ser.serialize(root));
```

## BFS Solution

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
public class Codec {

    // Encodes a tree to a single string.
    public String serialize(TreeNode root) {
        StringBuilder sb = new StringBuilder();
        Queue<TreeNode> q = new LinkedList<>();
        
        q.add(root);
        
        while (q.size() > 0) {
            
            TreeNode node = q.poll();
            
            if (node == null) {
                sb.append("#,");
            } else {
                sb.append(node.val).append(",");
                q.add(node.left);
                q.add(node.right);
            }
         }
        // System.out.println(sb.toString());
        return sb.toString();
    }

    // Decodes your encoded data to tree.
    public TreeNode deserialize(String data) {
        
        String[] values = data.split(",");
        
        // System.out.println(Arrays.toString(values));
        
        if (values.length == 0) return null;
        Queue<TreeNode> q = new LinkedList<>();
        TreeNode root = parse(values, 0);
        q.add(root);
        
        for (int i = 1; i < values.length; i++) {
                
            TreeNode parent = q.poll();
            
            parent.left = parse(values, i);
            if (parent.left  != null) {
                 q.add(parent.left);
            }
            
            i++;
            parent.right = parse(values, i);
            
            if (parent.right != null) {
                q.add(parent.right);
            }
        }

        return root;
    }
    
    TreeNode parse(String[] values, int index) {
        if (index >= values.length) return null;
        String val = values[index];
        return val.equals("#") ? null: new TreeNode(Integer.valueOf(val));
    }
}

// Your Codec object will be instantiated and called as such:
// Codec ser = new Codec();
// Codec deser = new Codec();
// TreeNode ans = deser.deserialize(ser.serialize(root));
```
