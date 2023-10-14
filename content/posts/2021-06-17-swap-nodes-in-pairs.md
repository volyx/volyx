---
author: "volyx"
title:  "24. Swap Nodes in Pairs"
date: "2021-06-17"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "linked-list"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[24. Swap Nodes in Pairs](https://leetcode.com/problems/swap-nodes-in-pairs/)

Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

```txt
Example 1:

Input: head = [1,2,3,4]
Output: [2,1,4,3]
```

![ex1](/images/2021-06-17-ex1.jpg)

```txt
Example 2:

Input: head = []
Output: []

Example 3:

Input: head = [1]
Output: [1]
```

Constraints:

- The number of nodes in the list is in the range [0, 100].
- 0 <= Node.val <= 100

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
    public ListNode swapPairs(ListNode head) {
        ListNode dummy = new ListNode(0);
        dummy.next = head;
        
        ListNode runner = dummy;
        
        while (runner.next != null && runner.next.next != null) {
            
            ListNode r1 = runner.next;
            ListNode r2 = runner.next.next;
            
            runner.next = r2;
            r1.next = r2.next;
            r2.next = r1;
            
            runner = runner.next.next;
        }
        return dummy.next;
    }
}
```
