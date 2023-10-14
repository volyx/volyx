---
author: "volyx"
title:  "1305. All Elements in Two Binary Search Trees"
date: "2021-10-28"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "binary-tree", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1305. All Elements in Two Binary Search Trees](https://leetcode.com/problems/all-elements-in-two-binary-search-trees/)

Given two binary search trees root1 and root2.

Return a list containing all the integers from both trees sorted in ascending order.

![ex1](/images/2021-10-28-bst-all-ex1.png)

```txt
Example 1:

Input: root1 = [2,1,4], root2 = [1,0,3]
Output: [0,1,1,2,3,4]

Example 2:

Input: root1 = [0,-10,10], root2 = [5,1,7,0,2]
Output: [-10,0,0,1,2,5,7,10]

Example 3:

Input: root1 = [], root2 = [5,1,7,0,2]
Output: [0,1,2,5,7]

Example 4:

Input: root1 = [0,-10,10], root2 = []
Output: [-10,0,10]
```

```txt
Example 5:

Input: root1 = [1,null,8], root2 = [8,1]
Output: [1,1,8,8]
```

![ex2](/images/2021-10-28-bst-all-ex2.png)

Constraints:

- Each tree has at most 5000 nodes.
- Each node's value is between [-10^5, 10^5].

## Solution DFS

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


/*

    2
1      4


    1
0       3


s1: 2
s2: 1

*/
class Solution {
    
    public List<Integer> getAllElements2(TreeNode root1, TreeNode root2) {
        List<Integer> res1 = new ArrayList();
        List<Integer> res2 = new ArrayList();
        dfs(root1, res1);
        dfs(root2, res2);
        
        int i = 0; 
        int j = 0;
        List<Integer> res = new ArrayList();
        while (i < res1.size() && j < res2.size()) {
            if (res1.get(i) < res2.get(j)) {
                res.add(res1.get(i));
                i++;
            } else {
                 res.add(res2.get(j));
                j++;
            }
        }
        
        while (i < res1.size()) {
            res.add(res1.get(i));
            i++;
        }
            
        while (j < res2.size()) {
            res.add(res2.get(j));
            j++;
        }
        
        return res;
    
    }
    
    void dfs(TreeNode node, List<Integer> res) {
        if (node == null) {
            return;
        }
        
        dfs(node.left, res);
        
        res.add(node.val);

        dfs(node.right, res);
    }
    
}
```

## Solution Stack

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


/*

    2
1      4


    1
0       3


s1: 2
s2: 1

*/
class Solution {
    public List<Integer> getAllElements(TreeNode root1, TreeNode root2) {
        Stack<TreeNode> s1 = new Stack<>();
        Stack<TreeNode> s2 = new Stack<>();

        pushLeft(s1, root1);
        pushLeft(s2, root2);
        
        List<Integer> res = new ArrayList<>();
        
        while (s1.size() > 0 || s2.size() > 0) {
            Stack<TreeNode> s = null;
            if (s1.size() > 0 && s2.size() > 0) {
                if (s1.peek().val < s2.peek().val) {
                    s = s1;
                } else {
                    s = s2;
                }
            } else if (s1.size() > 0) {
                  s = s1;
            } else {
                 s = s2;
            }
            TreeNode node = s.pop();
            res.add(node.val);
            pushLeft(s, node.right);
        }
        return res;
    }
    
    void pushLeft(Stack<TreeNode> stack, TreeNode node) {
        while (node != null) {
            stack.push(node);
            node = node.left;
        }
    }
}
```
