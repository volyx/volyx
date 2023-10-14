---
author: "volyx"
title:  "19. Remove Nth Node From End of List"
date: "2021-06-14"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "linked-list"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[19. Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)

Given the head of a linked list, remove the nth node from the end of the list and return its head.

```txt
Example 1:

Input: head = [1,2,3,4,5], n = 2
Output: [1,2,3,5]
```

![ex1](/images/2021-06-04-remove-n-node-ex1.jpg)

```txt
Example 2:

Input: head = [1], n = 1
Output: []

Example 3:

Input: head = [1,2], n = 1
Output: [1]
```

Constraints:

- The number of nodes in the list is sz.
- 1 <= sz <= 30
- 0 <= Node.val <= 100
- 1 <= n <= sz

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
    public ListNode removeNthFromEnd(ListNode head, int n) {
        ListNode dummy = new ListNode(0);
        dummy.next= head;
        
        ListNode walker = dummy;
        ListNode runner = dummy;
        
        for (int i = 0; i < n + 1; i++) {
            runner = runner.next;
        }
        
        while (runner != null) {
            walker = walker.next;
            runner = runner.next;
        }
        
        walker.next = walker.next.next;
        
        return dummy.next;
    }
}
```
