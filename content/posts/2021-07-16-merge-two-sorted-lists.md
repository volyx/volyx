---
author: "volyx"
title:  "21. Merge Two Sorted Lists"
date: "2021-07-16"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "linked-list", "fb"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/)

Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.

```txt
Example 1:

Input: l1 = [1,2,4], l2 = [1,3,4]
Output: [1,1,2,3,4,4]

Example 2:

Input: l1 = [], l2 = []
Output: []

Example 3:

Input: l1 = [], l2 = [0]
Output: [0]
```

![ex1](/images/2021-07-16-ex1.jpg)

Constraints:

- The number of nodes in both lists is in the range [0, 50].
    -100 <= Node.val <= 100
- Both l1 and l2 are sorted in non-decreasing order.

## Solution

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode node1 = l1;
        ListNode node2 = l2;
        
        ListNode node3 = new ListNode(-1);
        ListNode head = node3;
        ListNode prev = null;
        while (node1 != null || node2 != null) {
            
            if (node1 != null && node2 != null) {
                if (node1.val < node2.val) {
                    ListNode node = new ListNode(node1.val);
                    node3.next = node;
                    prev = node3;
                    node1 = node1.next;
                } else {
                    ListNode node = new ListNode(node2.val);
                    node3.next = node;
                    prev = node3;
                    node2 = node2.next;
                }
            } else if (node1 != null) {
                ListNode node = new ListNode(node1.val);
                node3.next = node;
                prev = node3;
                node1 = node1.next;
            } else if (node2 != null) {
                ListNode node = new ListNode(node2.val);
                node3.next = node;
                prev = node3;
                node2 = node2.next;
            }
            node3 = node3.next;
        }
        return head.next;
    }
}
```

## Solution 2021-11-21

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode curr = new ListNode();
        ListNode root = curr;
        while (l1 != null || l2 != null) {
            if (l1 != null && l2 != null) {
                if (l1.val < l2.val) {
                    ListNode node = new ListNode(l1.val);
                    curr.next = node;
                    curr = curr.next;
                    l1 = l1.next;
                } else {
                    ListNode node = new ListNode(l2.val);
                    curr.next = node;
                    curr = curr.next;
                    l2 = l2.next;
                }
            } else if (l1 != null) {
                ListNode node = new ListNode(l1.val);
                curr.next = node;
                curr = curr.next;
                l1 = l1.next;
            } else {
                ListNode node = new ListNode(l2.val);
                curr.next = node;
                curr = curr.next;
                l2 = l2.next;
            }
        }
        return root.next;
    }
}
```
