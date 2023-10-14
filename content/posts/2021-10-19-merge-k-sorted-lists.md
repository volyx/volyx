---
author: "volyx"
title:  "23. Merge k Sorted Lists"
date: "2021-10-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "linked-list"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)

You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

Merge all the linked-lists into one sorted linked-list and return it.

```txt
Example 1:

Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]
Explanation: The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted list:
1->1->2->3->4->4->5->6
```

```txt
Example 2:

Input: lists = []
Output: []
```

```txt
Example 3:

Input: lists = [[]]
Output: []
```

Constraints:

- k == lists.length
- 0 <= k <= 10^4
- 0 <= lists[i].length <= 500
- -10^4 <= lists[i][j] <= 10^4
- lists[i] is sorted in ascending order.
- The sum of lists[i].length won't exceed 10^4.

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
    public ListNode mergeKLists(ListNode[] lists) {
        PriorityQueue<ListNode> heap = new PriorityQueue<>((a,b) -> {
            return a.val - b.val;
        });
        
        ListNode head = new ListNode();
        ListNode curr = head;
        
         for (ListNode node: lists) {
            if (node != null) {
                heap.add(node);
            }
        }
        
        while (heap.size() > 0) {
            ListNode node = heap.poll();
            curr.next = new ListNode(node.val);
            curr = curr.next;
            
            if (node.next != null) {
                heap.add(node.next);
            }
        }
        
        
        return head.next;
    }
}
```
