---
author: "volyx"
title:  "Populating Next Right Pointers in Each Node"
date: "2020-08-26"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

You are given a perfect binary tree where all leaves are on the same level, and every parent has two children. The binary tree has the following definition:

```cplusplus
struct Node {
  int val;
  Node *left;
  Node *right;
  Node *next;
}
```

Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

Initially, all next pointers are set to NULL.

Follow up:

- You may only use constant extra space.
- Recursive approach is fine, you may assume implicit stack space does not count as extra space for this problem.

Example 1:

![ex1](/images/2020-08-26-ex1.png)

![ex2](/images/2020-08-26-ex2.png)

Input: root = [1,2,3,4,5,6,7]
Output: [1,#,2,3,#,4,5,6,7,#]
Explanation: Given the above perfect binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.

Constraints:

- The number of nodes in the given tree is less than 4096.
- -1000 <= node.val <= 1000

Solution:

```java
/*
// Definition for a Node.
class Node {
    public int val;
    public Node left;
    public Node right;
    public Node next;

    public Node() {}

    public Node(int _val) {
        val = _val;
    }

    public Node(int _val, Node _left, Node _right, Node _next) {
        val = _val;
        left = _left;
        right = _right;
        next = _next;
    }
};
*/

class Solution {
    public Node connect(Node root) {
        if (root == null) {
            return null;
        }
        Queue<Node> queue = new LinkedList<>();
        queue.add(root);
        while (!queue.isEmpty()) {
            Node node = queue.poll();
            if (node.left != null) {
                node.left.next = node.right;
                queue.add(node.left);
            }
            if (node.right != null) {
                if (node.next != null)
                    node.right.next = node.next.left;
                queue.add(node.right);
            }
        }
        return root;
    }
}
