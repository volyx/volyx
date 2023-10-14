---
author: "volyx"
title:  "987. Vertical Order Traversal of a Binary Tree"
date: "2021-07-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "binary-tree", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[987. Vertical Order Traversal of a Binary Tree](https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/)

Given the root of a binary tree, calculate the vertical order traversal of the binary tree.

For each node at position (row, col), its left and right children will be at positions (row + 1, col - 1) and (row + 1, col + 1) respectively. The root of the tree is at (0, 0).

The vertical order traversal of a binary tree is a list of top-to-bottom orderings for each column index starting from the leftmost column and ending on the rightmost column. There may be multiple nodes in the same row and same column. In such a case, sort these nodes by their values.

Return the vertical order traversal of the binary tree.

```txt
Example 1:

Input: root = [3,9,20,null,null,15,7]
Output: [[9],[3,15],[20],[7]]
Explanation:
Column -1: Only node 9 is in this column.
Column 0: Nodes 3 and 15 are in this column in that order from top to bottom.
Column 1: Only node 20 is in this column.
Column 2: Only node 7 is in this column.
```

![ex1](/images/2021-07-22-ex1.jpg)

```txt
Example 2:

Input: root = [1,2,3,4,5,6,7]
Output: [[4],[2],[1,5,6],[3],[7]]
Explanation:
Column -2: Only node 4 is in this column.
Column -1: Only node 2 is in this column.
Column 0: Nodes 1, 5, and 6 are in this column.
          1 is at the top, so it comes first.
          5 and 6 are at the same position (2, 0), so we order them by their value, 5 before 6.
Column 1: Only node 3 is in this column.
Column 2: Only node 7 is in this column.
```

![ex2](/images/2021-07-22-ex2.jpg)

```txt
Example 3:

Input: root = [1,2,3,4,6,5,7]
Output: [[4],[2],[1,5,6],[3],[7]]
Explanation:
This case is the exact same as example 2, but with nodes 5 and 6 swapped.
Note that the solution remains the same since 5 and 6 are in the same location and should be ordered by their values.
```

![ex3](/images/2021-07-22-ex3.jpg)

Constraints:

- The number of nodes in the tree is in the range [1, 1000].
- 0 <= Node.val <= 1000

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
  List < List < Integer >> verticalTraversal(TreeNode root) {

    if (root == null) return Collections.emptyList();

    List<List<Node>> posList = new ArrayList<>();
    List<List<Node>> negList = new ArrayList<>();
    dfs(root, 0, 0, negList, posList);
    return mergeAndSort(negList, posList);
  }

  class Node {
    int val;
    int row;
    
    public Node(int val, int row) {
        this.val = val;
        this.row = row;
    }  
  }

  void dfs(TreeNode node, int row, int col, List<List<Node>> negList, List<List<Node>> posList) {

    if (node == null) return;

    if (col >= 0) {
      if (posList.size() == col) {
        posList.add(new ArrayList < >());
      }
      posList.get(col).add(new Node(node.val, row));

    } else {
      int posCol = -col - 1;
      if (negList.size() == posCol) {
        negList.add(new ArrayList<>());
      }
      negList.get(posCol).add(new Node(node.val, row));
    }

    // (row + 1, col - 1) left
    dfs(node.left, row + 1, col - 1, negList, posList);

    // and (row + 1, col + 1) right
    dfs(node.right, row + 1, col + 1, negList, posList);

  }

  List<List<Integer>> mergeAndSort(List<List<Node>> negList, List<List<Node>> posList) {
    List<List<Integer>> res = new ArrayList<>();

    for (int i = negList.size() - 1; i >= 0; i--) {
      List<Node> colList = negList.get(i);
      colList.sort((a, b) -> a.row == b.row ? a.val - b.val : a.row - b.row);
      res.add(buildList(colList)); 
    }

    for (int i = 0; i < posList.size(); i++) {
      List<Node> colList = posList.get(i);
      colList.sort((a, b) -> a.row == b.row ? a.val - b.val : a.row - b.row);
      res.add(buildList(colList)); 
    }

    return res;
  }
    
  List<Integer> buildList(List<Node> list) {
      return list.stream().map(a -> a.val).collect(Collectors.toList());
  }  
}
```

## Solution 2022-01-29

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

    int min = 0;
    int max = 0;
    public List<List<Integer>> verticalTraversal(TreeNode root) {
        List<List<NodeValue>> res = new ArrayList<>();
        computeRange(root, 0);
        for (int i = min; i <= max; i++) {
            res.add(new ArrayList<>());
        }
        Queue<NodeValue> q = new ArrayDeque<>();
        q.add(new NodeValue(root, 0, -min));
        while (q.size() > 0) {
            NodeValue nodeVal = q.poll();
            res.get(nodeVal.col).add(nodeVal);
            
            if (nodeVal.node.left != null) {
                q.add(new NodeValue(nodeVal.node.left, nodeVal.row + 1, nodeVal.col - 1));
            }
            if (nodeVal.node.right != null) {
                q.add(new NodeValue(nodeVal.node.right, nodeVal.row + 1, nodeVal.col + 1));
            }
        }
        for (int i = 0; i < res.size(); i++) {
            Collections.sort(res.get(i), (a,b) -> {
                int c = Integer.compare(a.row, b.row);
                if (c != 0) return c;
                return Integer.compare(a.node.val, b.node.val);
            });
        }
        List<List<Integer>> resInt = new ArrayList();
        for (List<NodeValue> nodes : res) {
            List<Integer> rows = new ArrayList<>();
            for (NodeValue n: nodes) {
                rows.add(n.node.val);
            }
            resInt.add(rows);
        }
        return resInt;
    }
    
    class NodeValue{
        TreeNode node;
        int row;
        int col;
        
        NodeValue(TreeNode node, int row, int col) {
            this.node = node;
            this.row = row;
            this.col = col;
        }
    }
    
    void computeRange(TreeNode node, int id) {
        if (node == null) return;
        min = Math.min(min, id);
        max = Math.max(max, id);
        computeRange(node.left, id - 1);
        computeRange(node.right, id + 1);
    }
}
```
