---
author: "volyx"
title:  "328. Odd Even Linked List"
date: "2021-05-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "linked-list"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[328. Odd Even Linked List](https://leetcode.com/problems/odd-even-linked-list/)

Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list.

The first node is considered odd, and the second node is even, and so on.

Note that the relative order inside both the even and odd groups should remain as it was in the input.

```txt
Example 1:

Input: head = [1,2,3,4,5]
Output: [1,3,5,2,4]
```

![ex1](/images/2021-05-20-ex1.jpg)

```txt
Example 2:

Input: head = [2,1,3,5,6,4,7]
Output: [2,3,6,7,1,5,4]
```

![ex2](/images/2021-05-20-ex2.jpg)

Constraints:

- The number of nodes in the linked list is in the range [0, 104].
- -106 <= Node.val <= 106

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
    public ListNode oddEvenList(ListNode head) {
        if (head == null || head.next == null) return head;

            /// 0 1 2 3 4 5
            /// 
            ListNode odd = head; // 0 --> 2 -- 4
            ListNode oddHead = odd; // 0
            ListNode even = head.next; // 1 -- 3 -- 5
            ListNode evenHead = even; // 1
            int counter = 2;
            ListNode node = even.next; // 2

            // 2
            while (node != null) {
             if (counter % 2 == 0) {
              odd.next = node;
              odd = odd.next;
             } else {
              even.next = node;
              even = even.next;
             }

             counter++;
             node = node.next;
            }

            // oddHead-->...----> evenHead--->....-->-------->null
            // 0 --> 2 -- 4  -- 1 -- 3 -- 5
            odd.next = evenHead;
            even.next = null;

            head = oddHead;
        return oddHead;
    }
}
```
