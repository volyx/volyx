---
author: "volyx"
title:  "Remove Linked List Elements"
date: "2020-05-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Remove all elements from a linked list of integers that have value val.

Example:
```
Input:  1->2->6->3->4->5->6, val = 6
Output: 1->2->3->4->5
```


Solution: 

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
    public ListNode removeElements(ListNode head, int val) {
        if (head == null) {
            return head;
        }
        while (head != null && head.val == val) {
            head = head.next;
        }

        ListNode node = head;
        ListNode prev = null;

        while (node != null) {
            if (node.val == val) {
                prev.next = node.next;  
            } else {
                prev = node; 
            }
            node = node.next;
        }
        return head;
    }
}
