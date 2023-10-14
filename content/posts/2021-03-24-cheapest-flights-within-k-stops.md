---
author: "volyx"
title:  "787. Cheapest Flights Within K Stops"
date: "2021-03-24"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "graph", "dijkstra"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[787. Cheapest Flights Within K Stops](https://leetcode.com/problems/cheapest-flights-within-k-stops/)

There are n cities connected by m flights. Each flight starts from city u and arrives at v with a price w.

Now given all the cities and flights, together with starting city src and the destination dst, your task is to find the cheapest price from src to dst with up to k stops. If there is no such route, output -1.

```txt
Example 1:
Input: 
n = 3, edges = [[0,1,100],[1,2,100],[0,2,500]]
src = 0, dst = 2, k = 1
Output: 200
Explanation: 
The graph looks like this:
```

![ex1](/images/2021-03-24-ex1.png)

The cheapest price from city 0 to city 2 with at most 1 stop costs 200, as marked red in the picture.

```txt
Example 2:
Input: 
n = 3, edges = [[0,1,100],[1,2,100],[0,2,500]]
src = 0, dst = 2, k = 0
Output: 500
Explanation: 
The graph looks like this:
```

![ex2](/images/2021-03-24-ex2.png)

The cheapest price from city 0 to city 2 with at most 0 stop costs 500, as marked blue in the picture.

Constraints:

- The number of nodes n will be in range [1, 100], with nodes labeled from 0 to n - 1.
- The size of flights will be in range [0, n * (n - 1) / 2].
- The format of each flight will be (src, dst, price).
- The price of each flight will be in the range [1, 10000].
- k is in the range of [0, n - 1].
- There will not be any duplicated flights or self cycles.

## Jamboard

![jam1](/images/787_Cheapest_Flights_Within_K_Stops.png)

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
    int[] preorder;
    int preorderIndex; 
    Map<Integer, Integer> order;
                   
    public TreeNode buildTree(int[] preorder, int[] inorder) {
           this.preorder = preorder;
           order = new HashMap<>();
           for (int i = 0; i < inorder.length; i++) {
               order.put(inorder[i], i);
           }
           return build(0, preorder.length - 1);
    }
    
    TreeNode build(int start, int end) {
        if (start > end) return null;
        
        TreeNode node = new TreeNode(preorder[preorderIndex]);
        int pos = order.get(preorder[preorderIndex++]);
        node.left = build(start, pos - 1);
        node.right = build(pos + 1, end);
        
        return node;
    }
    
    public TreeNode buildTree2(int[] preorder, int[] inorder) {
        TreeNode root = new TreeNode(preorder[0]);
        Map<Integer, Integer> order = new HashMap<>();
        for (int i = 0; i < inorder.length; i++) {
            order.put(inorder[i], i);
        }
        for (int i = 1; i < preorder.length; i++) {
            addNode(root, preorder[i], order);
        }
        return root;
    }
    
    void addNode(TreeNode node, int val, Map<Integer, Integer> order) {
        if (order.get(val) < order.get(node.val)) {
            if (node.left == null) {
                node.left = new TreeNode(val);
            } else {
                addNode(node.left, val, order);
            }
        } else {
            if (node.right == null) {
                node.right = new TreeNode(val);
            } else {
                addNode(node.right, val, order);
            }
        }
    }
}
```
