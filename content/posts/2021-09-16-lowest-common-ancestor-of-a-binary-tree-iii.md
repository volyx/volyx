---
author: "volyx"
title:  "1650. Lowest Common Ancestor of a Binary Tree III"
date: "2021-09-16"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1650. Lowest Common Ancestor of a Binary Tree III](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-iii)

Given two nodes of a binary tree p and q, return their lowest common ancestor (LCA).

Each node will have a reference to its parent node. The definition for Node is below:

```java
class Node {
    public int val;
    public Node left;
    public Node right;
    public Node parent;
}
```

According to the definition of LCA on Wikipedia: "The lowest common ancestor of two nodes p and q in a tree T is the lowest node that has both p and q as descendants (where we allow a node to be a descendant of itself)."

```txt
Example 1:

Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
Output: 3
Explanation: The LCA of nodes 5 and 1 is 3.
```

![ex1](/images/2021-09-16-tree-ex1.png)

```txt
Example 2:

Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
Output: 5
Explanation: The LCA of nodes 5 and 4 is 5 since a node can be a descendant of itself according to the LCA definition.
```

![ex1](/images/2021-09-16-tree-ex2.png)

```txt
Example 3:

Input: root = [1,2], p = 1, q = 2
Output: 1
```

Constraints:

- The number of nodes in the tree is in the range [2, 105].
- -10^9 <= Node.val <= 10^9
- All Node.val are unique.
- p != q
- p and q exist in the tree.

```java
/*
// Definition for a Node.
class Node {
    public int val;
    public Node left;
    public Node right;
    public Node parent;
};
*/

class Solution {
    public Node lowestCommonAncestor(Node p, Node q) {
        
        Node runner1 = p;
        Node runner2 = q;
        
        
        while (runner1 != runner2) {
            runner1 = (runner1 == null) ? q: runner1.parent;
            runner2 = (runner2 == null) ? p: runner2.parent;
        }
        return runner1;
    }
    
    /** DIFF HEIGTH APROACH **/
    public Node lowestCommonAncestor2(Node p, Node q) {
        int depth1 = depth(p);
        int depth2 = depth(q);
        
        if (depth1 < depth2) {
            return lowestCommonAncestor(q, p);
        }
        int diff = depth1 - depth2;
        while (diff > 0) {
            p = p.parent;
            diff--;
        }
        while (p != q) {
            q = q.parent;
            p = p.parent;
        }
        
        return p;
    }    
    
    int depth(Node node) {
        Node parent = node.parent;
        int count = 0;
        while (parent != null) {
            parent = parent.parent;
            count++;
        }
        return count;
    } 
    
    
    
    /** HASH SET APPROACH */
    public Node lowestCommonAncestor1(Node p, Node q) {
        Set<Node> seen = new HashSet<Node>();
        
        while (p != null) {
            seen.add(p);
            p = p.parent;
        }
        
        while (q != null) {
            if (seen.contains(q)) {
                return q;
            }
            q = q.parent;
        }
        
        return null;
    }
}
```

## Solution 2022-01-30

```java
/*
// Definition for a Node.
class Node {
    public int val;
    public Node left;
    public Node right;
    public Node parent;
};
*/

class Solution {
    public Node lowestCommonAncestor(Node p, Node q) {
        Node s = p;
        Node f = q;
        while (s != f) {
            s = s.parent;
            f = f.parent;
            
            if (s == null) {
                s = p;
            }
            if (f == null) {
                f = q;
            }
        }
        return s;
    }
}
```
