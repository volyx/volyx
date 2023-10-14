---
author: "volyx"
title:  "206. Reverse Linked List"
date: "2021-06-17"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "linked-list"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[206. Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/)

Given the head of a singly linked list, reverse the list, and return the reversed list.

```txt
Example 1:

Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]
```

![ex1](/images/2021-06-17-reverse-ex1.jpg)

```txt
Example 2:

Input: head = [1,2]
Output: [2,1]
```

![ex2](/images/2021-06-17-reverse-ex2.jpg)

```txt
Example 3:

Input: head = []
Output: []
```

Constraints:

- The number of nodes in the list is the range [0, 5000].
- -5000 <= Node.val <= 5000

Follow up: A linked list can be reversed either iteratively or recursively. Could you implement both?

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
    public ListNode reverseList(ListNode head) {
        
        ListNode prev = null;

        while (head != null) {
            ListNode nextNode = head.next;
            
            head.next = prev;
            
            prev = head;
            
            head = nextNode;
        }
        
        return prev;
    }
}
```
