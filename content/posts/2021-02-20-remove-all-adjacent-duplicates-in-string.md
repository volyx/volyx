---
author: "volyx"
title:  "1047. Remove All Adjacent Duplicates In String"
date: "2021-02-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1047. Remove All Adjacent Duplicates In String](https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/)

Given a string S of lowercase letters, a duplicate removal consists of choosing two adjacent and equal letters, and removing them.

We repeatedly make duplicate removals on S until we no longer can.

Return the final string after all such duplicate removals have been made.  It is guaranteed the answer is unique.

```txt
Example 1:

Input: "abbaca"
Output: "ca"
Explanation: 
For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".
```

Note:

- 1 <= S.length <= 20000
- S consists only of English lowercase letters.

```java
class Solution {
    public String removeDuplicates(String S) {
        char[] symbols = S.toCharArray();
        char[] stack = new char[symbols.length];
        int size = 0;
        for (int i = 0; i < symbols.length ; i++) {
            char c = symbols[i];
            if (size > 0 && stack[size - 1] == c) {
                size--;
            } else {
                stack[size++] = c;
            }
        }
        return new String(stack, 0, size);
    }
    public String removeDuplicates2(String S) {
        char[] symbols = S.toCharArray();
        List<Character> stack = new ArrayList<>();
        for (int i = 0; i < symbols.length ; i++) {
            char c = symbols[i];
            if (!stack.isEmpty() && stack.get(stack.size() - 1) == c) {
                stack.remove(stack.size() - 1);
            } else {
                stack.add(c);
            }
        }

        StringBuilder sb = new StringBuilder();

        for (Character c: stack) {
            sb.append(c);
        }
        return sb.toString();
    }
}
```

## Solution 2022-01-30

```java
class Solution {
    public String removeDuplicates(String s) {
        Deque<Character> stack = new ArrayDeque<>();
        
        for (char c : s.toCharArray()) {
            if (stack.size() > 0 && stack.peek() == c) {
                stack.pop();
            } else {
                stack.push(c);
            }
        }
        
        StringBuilder sb = new StringBuilder();
        while (stack.size() > 0) {
            sb.insert(0, stack.pop());
        }
        return sb.toString();
    }
}
```
